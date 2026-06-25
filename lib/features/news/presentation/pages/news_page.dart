import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/config/env_config.dart';
import '../../../../core/di/injection.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';
import '../../domain/entities/news_article.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();
  late final NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _newsBloc = locator<NewsBloc>()..add(const FetchNews());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _newsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = EnvConfig.primaryColor;

    return BlocProvider.value(
      value: _newsBloc,
      child: Scaffold(
      appBar: AppBar(
        title: Text(EnvConfig.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_rounded),
            tooltip: "Profil Mahasiswa",
            onPressed: () => context.push('/profile'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner Status (DEV vs PROD Info)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: EnvConfig.isProd ? const Color(0xFF0F172A) : const Color(0xFF312E81),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Enterprise Smart Dashboard",
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Text(
                  "NIM: 20123074",
                  style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (val) {
                setState(() {
                  _searchQuery = val.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: "Cari berita berdasarkan judul...",
                prefixIcon: Icon(Icons.search, color: primaryColor),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = "";
                          });
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: primaryColor.withValues(alpha: 0.5), width: 1.5),
                ),
              ),
            ),
          ),

          // News Feed
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text("Mengunduh berita terpercaya..."),
                      ],
                    ),
                  );
                }

                if (state is NewsError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wifi_off_rounded, size: 64, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          Text(
                            "Koneksi Gagal & Tidak Ada Cache",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey.shade800),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Pastikan perangkat Anda terhubung ke internet untuk mengambil data pertama kali.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, height: 1.4),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: () {
                              context.read<NewsBloc>().add(const FetchNews(forceRefresh: true));
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text("Coba Lagi"),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (state is NewsLoaded) {
                  final allArticles = state.articles;
                  
                  // Filter by search query
                  final articles = allArticles.where((article) {
                    return article.title.toLowerCase().contains(_searchQuery) ||
                        article.summary.toLowerCase().contains(_searchQuery);
                  }).toList();

                  if (articles.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off_rounded, size: 64, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          Text(
                            "Tidak ada berita yang cocok",
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<NewsBloc>().add(const FetchNews(forceRefresh: true));
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        return _buildNewsCard(context, article);
                      },
                    ),
                  );
                }

                return const Center(child: Text("Silakan segarkan halaman."));
              },
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildNewsCard(BuildContext context, NewsArticle article) {
    final theme = Theme.of(context);
    final primaryColor = EnvConfig.primaryColor;
    final formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(article.publishedAt);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Navigasi ke detail berita
          context.push('/detail/${article.id}', extra: {
            'title': article.title,
            'summary': article.summary,
            'imageUrl': article.imageUrl,
            'newsSite': article.newsSite,
            'publishedAt': article.publishedAt.toIso8601String(),
            'url': article.url,
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Berita
            Stack(
              children: [
                 (article.imageUrl.isNotEmpty && (article.imageUrl.startsWith('http://') || article.imageUrl.startsWith('https://')))
                    ? Image.network(
                        article.imageUrl,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 180,
                            color: Colors.grey.shade200,
                            child: Center(
                              child: Icon(Icons.image_not_supported_rounded,
                                  size: 48, color: Colors.grey.shade400),
                            ),
                          );
                        },
                      )
                    : Container(
                        height: 180,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: Icon(Icons.image_not_supported_rounded,
                              size: 48, color: Colors.grey.shade400),
                        ),
                      ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      article.newsSite,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        formattedDate,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.summary,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Baca Selengkapnya",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward_rounded, size: 14, color: primaryColor),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
