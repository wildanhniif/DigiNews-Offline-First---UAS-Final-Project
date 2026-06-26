import 'package:isar/isar.dart';
import '../../domain/entities/news_article.dart';
import 'news_article_model.dart';

part 'news_article_collection.g.dart';

@collection
class NewsArticleCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  int? articleId;

  String? title;
  String? summary;
  String? imageUrl;
  String? newsSite;
  String? publishedAt;
  String? url;

  NewsArticle toEntity() {
    return NewsArticle(
      id: articleId ?? 0,
      title: title ?? '',
      summary: summary ?? '',
      imageUrl: imageUrl ?? '',
      newsSite: newsSite ?? '',
      publishedAt: DateTime.tryParse(publishedAt ?? '') ?? DateTime.now(),
      url: url ?? '',
    );
  }

  static NewsArticleCollection fromModel(NewsArticleModel model) {
    final col = NewsArticleCollection();
    col.articleId = model.id;
    col.title = model.title;
    col.summary = model.summary;
    col.imageUrl = model.imageUrl;
    col.newsSite = model.newsSite;
    col.publishedAt = model.publishedAt;
    col.url = model.url;
    return col;
  }
}
