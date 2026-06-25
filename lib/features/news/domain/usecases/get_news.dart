import '../entities/news_article.dart';
import '../repositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  const GetNews(this.repository);

  Future<List<NewsArticle>> call({bool forceRefresh = false}) {
    return repository.getNews(forceRefresh: forceRefresh);
  }
}
