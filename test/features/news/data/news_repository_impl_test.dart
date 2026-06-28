import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:utd_advanced_app/features/news/data/datasources/news_local_datasource.dart';
import 'package:utd_advanced_app/features/news/data/datasources/news_remote_datasource.dart';
import 'package:utd_advanced_app/features/news/data/models/news_article_model.dart';
import 'package:utd_advanced_app/features/news/data/models/news_article_collection.dart';
import 'package:utd_advanced_app/features/news/data/repositories/news_repository_impl.dart';

class MockRemoteDataSource extends Mock implements NewsRemoteDataSource {}
class MockLocalDataSource extends Mock implements NewsLocalDataSource {}

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late NewsRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    repository = NewsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group('NewsRepositoryImpl - Sorting & Caching Tests', () {
    final tModel1 = NewsArticleModel(
      id: 1,
      title: 'Zeta article',
      summary: 'Summary 1',
      imageUrl: 'image1',
      newsSite: 'site1',
      publishedAt: '2023-10-18T12:00:00Z',
      url: 'url1',
    );

    final tModel2 = NewsArticleModel(
      id: 2,
      title: 'Alpha article',
      summary: 'Summary 2',
      imageUrl: 'image2',
      newsSite: 'site2',
      publishedAt: '2023-10-18T13:00:00Z',
      url: 'url2',
    );

    final tModels = [tModel1, tModel2];

    test('should sort articles alphabetically A-Z (Ascending) for Even NIM', () async {
      // arrange
      when(() => mockRemoteDataSource.fetchArticles(limit: any(named: 'limit')))
          .thenAnswer((_) async => tModels);
      when(() => mockLocalDataSource.cacheArticles(any()))
          .thenAnswer((_) async => {});

      // act
      final result = await repository.getNews(forceRefresh: true);

      // assert
      expect(result.length, 2);
      expect(result[0].title, 'Alpha article'); // A-Z sorting (Ascending)
      expect(result[1].title, 'Zeta article');
      
      verify(() => mockRemoteDataSource.fetchArticles()).called(1);
    });

    test('should return cached data when forceRefresh is false and cache is not empty', () async {
      // arrange
      final tCollection = NewsArticleCollection.fromModel(tModel1);
      when(() => mockLocalDataSource.getCachedArticles())
          .thenAnswer((_) async => [tCollection]);

      // act
      final result = await repository.getNews(forceRefresh: false);

      // assert
      expect(result.length, 1);
      expect(result[0].title, 'Zeta article');
      verify(() => mockLocalDataSource.getCachedArticles()).called(1);
      verifyNever(() => mockRemoteDataSource.fetchArticles());
    });
  });
}
