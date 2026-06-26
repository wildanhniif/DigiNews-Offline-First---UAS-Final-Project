import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/news/data/models/news_article_collection.dart';

class IsarService {
  IsarService._();

  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NewsArticleCollectionSchema],
      directory: dir.path,
    );
  }
}
