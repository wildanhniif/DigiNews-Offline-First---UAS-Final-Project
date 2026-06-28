import 'package:flutter/material.dart';
import 'core/config/env_config.dart';
import 'core/theme/app_theme.dart';
import 'core/routing/app_router.dart';
import 'core/di/injection.dart';
import 'core/database/isar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Isar Database
  try {
    await IsarService.init();
  } catch (e) {
    debugPrint('[IsarService] Gagal inisialisasi Isar: $e');
  }

  // Setup Dependency Injection (GetIt)
  setupLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: EnvConfig.isDev,
      title: EnvConfig.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // NIM berakhiran genap (4) -> Wajib Light Mode
      routerConfig: AppRouter.router,
    );
  }
}
