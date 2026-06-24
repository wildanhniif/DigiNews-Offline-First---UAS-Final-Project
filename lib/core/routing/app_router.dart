import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/news/presentation/pages/news_page.dart';
import '../../features/news/presentation/pages/news_detail_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  AppRouter._();

  static bool splashShown = false;

  static final router = GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      // Jika splash belum ditampilkan dan user bukan di /splash, paksa ke /splash
      if (!splashShown && state.uri.path != '/splash') {
        return '/splash';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const NewsPage(),
      ),
      GoRoute(
        path: '/detail/:id',
        builder: (context, state) {
          final articleIdStr = state.pathParameters['id'] ?? '';
          final articleId = int.tryParse(articleIdStr) ?? 0;
          
          // Kita bisa melewatkan objek artikel melalui state.extra untuk performa offline-first cepat
          final extra = state.extra;
          
          return NewsDetailPage(
            articleId: articleId,
            preloadedArticle: extra is Map<String, dynamic> ? extra : null,
          );
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error 404')),
      body: const Center(child: Text('Halaman tidak ditemukan!')),
    ),
  );
}
