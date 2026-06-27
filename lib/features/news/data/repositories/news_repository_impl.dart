import '../../domain/entities/news_article.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_local_datasource.dart';
import '../datasources/news_remote_datasource.dart';
import '../models/news_article_collection.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<NewsArticle>> getNews({bool forceRefresh = false}) async {
    List<NewsArticle> articles = [];

    // Jika tidak dipaksa refresh, coba ambil data dari cache lokal (Isar) terlebih dahulu
    if (!forceRefresh) {
      try {
        final cached = await localDataSource.getCachedArticles();
        if (cached.isNotEmpty) {
          articles = cached.map((col) => col.toEntity()).toList();
        }
      } catch (e) {
        // Abaikan error pembacaan database lokal, coba lanjut ambil remote
      }
    }

    // Jika cache kosong atau dipaksa refresh, ambil data dari API remote (Dio)
    if (articles.isEmpty || forceRefresh) {
      try {
        final remoteModels = await remoteDataSource.fetchArticles();
        
        // Konversi ke model Isar Collection dan simpan ke database lokal
        final collections = remoteModels
            .map((model) => NewsArticleCollection.fromModel(model))
            .toList();
        await localDataSource.cacheArticles(collections);

        articles = remoteModels.map((model) => model.toEntity()).toList();
      } catch (e) {
        // Jika gagal mengambil data remote (misalnya offline/Airplane mode), fallback ke cache lokal
        final cached = await localDataSource.getCachedArticles();
        if (cached.isNotEmpty) {
          articles = cached.map((col) => col.toEntity()).toList();
        } else {
          // Jika benar-benar tidak ada internet dan cache juga kosong, lempar error asli
          rethrow;
        }
      }
    }

    // 🔥 TANTANGAN ANTI-AI: Manipulasi pengurutan list data berdasarkan digit terakhir NIM
    // NIM Akhir: 4 (GENAP) -> Urutkan dari A ke Z (Ascending) berdasarkan Judul (Title)
    articles.sort((a, b) => a.title.compareTo(b.title));

    return articles;
  }
}
