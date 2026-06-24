import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:utd_advanced_app/features/news/domain/entities/news_article.dart';
import 'package:utd_advanced_app/features/news/domain/usecases/get_news.dart';
import 'package:utd_advanced_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:utd_advanced_app/features/news/presentation/bloc/news_event.dart';
import 'package:utd_advanced_app/features/news/presentation/bloc/news_state.dart';

class MockGetNews extends Mock implements GetNews {}

void main() {
  late MockGetNews mockGetNews;
  late NewsBloc newsBloc;

  setUp(() {
    mockGetNews = MockGetNews();
    newsBloc = NewsBloc(getNews: mockGetNews);
  });

  tearDown(() {
    newsBloc.close();
  });

  group('NewsBloc Tests', () {
    final tArticles = [
      NewsArticle(
        id: 1,
        title: 'Title 1',
        summary: 'Summary 1',
        imageUrl: 'image1',
        newsSite: 'site1',
        publishedAt: DateTime(2023, 10, 18),
        url: 'url1',
      )
    ];

    test('should emit [NewsLoading, NewsLoaded] when FetchNews is successful', () {
      // arrange
      when(() => mockGetNews(forceRefresh: any(named: 'forceRefresh')))
          .thenAnswer((_) async => tArticles);

      // assert later
      final expectedStates = [
        NewsLoading(),
        NewsLoaded(tArticles),
      ];
      expectLater(newsBloc.stream, emitsInOrder(expectedStates));

      // act
      newsBloc.add(const FetchNews());
    });

    test('should emit [NewsLoading, NewsError] when FetchNews fails', () {
      // arrange
      when(() => mockGetNews(forceRefresh: any(named: 'forceRefresh')))
          .thenThrow(Exception('Gagal mengambil berita'));

      // assert later
      final expectedStates = [
        NewsLoading(),
        const NewsError('Exception: Gagal mengambil berita'),
      ];
      expectLater(newsBloc.stream, emitsInOrder(expectedStates));

      // act
      newsBloc.add(const FetchNews());
    });
  });
}
