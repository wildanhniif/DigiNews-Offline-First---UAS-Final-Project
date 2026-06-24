import 'package:flutter/material.dart';

class EnvConfig {
  EnvConfig._();

  // 1. Menangkap flavor (dev atau prod) dari terminal
  static const String flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'dev',
  );

  // 2. Menangkap nama aplikasi dari terminal
  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'DEV - Wildan',
  );

  // Helper untuk cek flavor
  static bool get isDev => flavor == 'dev';
  static bool get isProd => flavor == 'prod';

  // 3. Menentukan warna utama aplikasi secara dinamis berdasarkan flavor
  // DEV: Indigo (bebas), PROD: Biru Gelap (wajib)
  static Color get primaryColor {
    if (isProd) {
      return const Color(0xFF0D1B2A); // Biru Gelap murni
    } else {
      return const Color(0xFF6366F1); // Indigo untuk DEV
    }
  }

  // Base URL untuk Spaceflight News API v4
  static const String baseUrl = 'https://api.spaceflightnewsapi.net/v4/';
}
