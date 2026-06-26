import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../models/news_article_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsArticleModel>> fetchArticles({int limit = 20});
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final ApiClient apiClient;

  NewsRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<NewsArticleModel>> fetchArticles({int limit = 20}) async {
    final response = await apiClient.dio.get(
      'articles/',
      queryParameters: {
        'limit': limit,
      },
    );

    if (response.statusCode == 200) {
      final data = response.data;
      if (data is Map<String, dynamic> && data.containsKey('results')) {
        final results = data['results'] as List;
        return results
            .map((json) => NewsArticleModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      throw Exception('Format respons API tidak sesuai');
    } else {
      throw Exception('Gagal mengambil berita dari server');
    }
  }
}
