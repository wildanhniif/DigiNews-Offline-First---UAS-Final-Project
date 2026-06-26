import '../../domain/entities/news_article.dart';

class NewsArticleModel {
  final int id;
  final String title;
  final String summary;
  final String imageUrl;
  final String newsSite;
  final String publishedAt;
  final String url;

  NewsArticleModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.newsSite,
    required this.publishedAt,
    required this.url,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      newsSite: json['news_site'] as String? ?? '',
      publishedAt: json['published_at'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'image_url': imageUrl,
      'news_site': newsSite,
      'published_at': publishedAt,
      'url': url,
    };
  }

  NewsArticle toEntity() {
    return NewsArticle(
      id: id,
      title: title,
      summary: summary,
      imageUrl: imageUrl,
      newsSite: newsSite,
      publishedAt: DateTime.tryParse(publishedAt) ?? DateTime.now(),
      url: url,
    );
  }
}
