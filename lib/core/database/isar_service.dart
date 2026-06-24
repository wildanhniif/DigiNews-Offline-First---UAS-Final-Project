import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/news/data/models/news_article_collection.dart';

class IsarService {
  IsarService._();

  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    try {
      isar = await Isar.open(
        [NewsArticleCollectionSchema],
        directory: dir.path,
      );
    } catch (e) {
      debugPrint('[IsarService] Terjadi kesalahan inisialisasi Isar: $e');
      debugPrint('[IsarService] Mencoba menghapus database lama yang tidak kompatibel...');
      
      // Path file default Isar database
      final dbFile = File('${dir.path}/default.isar');
      final dbLockFile = File('${dir.path}/default.isar.lock');
      
      try {
        if (await dbFile.exists()) {
          await dbFile.delete();
        }
        if (await dbLockFile.exists()) {
          await dbLockFile.delete();
        }
        debugPrint('[IsarService] Penghapusan database lama berhasil.');
      } catch (deleteError) {
        debugPrint('[IsarService] Gagal menghapus file database: $deleteError');
      }

      // Coba inisialisasi kembali setelah dihapus
      isar = await Isar.open(
        [NewsArticleCollectionSchema],
        directory: dir.path,
      );
    }
  }
}
