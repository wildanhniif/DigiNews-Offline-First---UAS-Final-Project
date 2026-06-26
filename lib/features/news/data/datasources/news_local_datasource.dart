import 'package:isar/isar.dart';
import '../models/news_article_collection.dart';

abstract class NewsLocalDataSource {
  Future<List<NewsArticleCollection>> getCachedArticles();
  Future<void> cacheArticles(List<NewsArticleCollection> articles);
  Future<void> clearCache();
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final Isar isar;

  NewsLocalDataSourceImpl(this.isar);

  @override
  Future<List<NewsArticleCollection>> getCachedArticles() async {
    return isar.newsArticleCollections.where().findAll();
  }

  @override
  Future<void> cacheArticles(List<NewsArticleCollection> articles) async {
    await isar.writeTxn(() async {
      for (final article in articles) {
        // Menggunakan put() yang akan secara otomatis menimpa jika articleId sudah ada (berkat annotation replace: true)
        await isar.newsArticleCollections.put(article);
      }
    });
  }

  @override
  Future<void> clearCache() async {
    await isar.writeTxn(() async {
      await isar.newsArticleCollections.clear();
    });
  }
}
