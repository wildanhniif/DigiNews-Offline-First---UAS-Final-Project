import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/config/env_config.dart';

class NewsDetailPage extends StatelessWidget {
  final int articleId;
  final Map<String, dynamic>? preloadedArticle;

  const NewsDetailPage({
    super.key,
    required this.articleId,
    this.preloadedArticle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = EnvConfig.primaryColor;

    final String title = preloadedArticle?['title'] ?? 'Detail Berita';
    final String summary = preloadedArticle?['summary'] ?? '';
    final String imageUrl = preloadedArticle?['imageUrl'] ?? '';
    final String newsSite = preloadedArticle?['newsSite'] ?? 'Berita';
    final String url = preloadedArticle?['url'] ?? '';
    final DateTime publishedAt = preloadedArticle?['publishedAt'] != null
        ? DateTime.tryParse(preloadedArticle!['publishedAt'] as String) ?? DateTime.now()
        : DateTime.now();

    final formattedDate = DateFormat('EEEE, dd MMMM yyyy HH:mm').format(publishedAt);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Berita"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Utama Berita
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: Colors.grey.shade200,
                    child: Center(
                      child: Icon(Icons.image_not_supported_rounded,
                          size: 64, color: Colors.grey.shade400),
                    ),
                  );
                },
              ),
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge Source / Portal Berita
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      newsSite,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Judul Berita
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.extrabold,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Tanggal Rilis
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_rounded, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        formattedDate,
                        style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  const Divider(height: 32, thickness: 1),
                  
                  // Isi Ringkasan Berita
                  Text(
                    "Ringkasan Berita",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    summary,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 15,
                      height: 1.6,
                      color: const Color(0xFF334155), // Slate 700
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Info/Petunjuk Kaki
                  if (url.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade100),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline_rounded, color: Colors.blue.shade700),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Portal Asli:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                SelectableText(
                                  url,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blue.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
