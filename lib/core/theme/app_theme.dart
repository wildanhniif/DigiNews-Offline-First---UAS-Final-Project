import 'package:flutter/material.dart';
import '../config/env_config.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final primaryColor = EnvConfig.primaryColor;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        brightness: Brightness.light,
        surface: const Color(0xFFF8FAFC), // Slate 50
        background: const Color(0xFFF1F5F9), // Slate 100
      ),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Color(0xFF0F172A),
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color(0xFF1E293B),
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Color(0xFF475569),
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Color(0xFF64748B),
        ),
      ),
    );
  }

  // Jika diperlukan, sediakan Dark Theme (wajib jika NIM ganjil, tapi karena genap kita jadikan opsional/light default)
  static ThemeData get darkTheme {
    final primaryColor = EnvConfig.primaryColor;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        brightness: Brightness.dark,
        surface: const Color(0xFF0F172A),
        background: const Color(0xFF020617),
      ),
      scaffoldBackgroundColor: const Color(0xFF020617),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF1E293B),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
