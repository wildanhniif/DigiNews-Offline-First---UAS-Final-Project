import 'package:equatable/equatable.dart';

class NewsArticle extends Equatable {
  final int id;
  final String title;
  final String summary;
  final String imageUrl;
  final String newsSite;
  final DateTime publishedAt;
  final String url;

  const NewsArticle({
    required this.id,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.newsSite,
    required this.publishedAt,
    required this.url,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        summary,
        imageUrl,
        newsSite,
        publishedAt,
        url,
      ];
}
