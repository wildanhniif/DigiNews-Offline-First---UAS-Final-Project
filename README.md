# DigiNews Offline-First - UAS Final Project

Aplikasi **DigiNews Offline-First** adalah aplikasi portal berita modular berbasis **Clean Architecture** yang dibangun untuk memenuhi kriteria evaluasi UAS Mobile Programming Lanjut. Aplikasi ini mengintegrasikan caching data lokal secara reaktif, MethodChannel native Kotlin, dan pipeline CI/CD otomatis.

## 📝 Profil Mahasiswa
- **Nama:** Wildan Hanif  
- **NIM:** 20123074  
- **Tema Aplikasi:** Enterprise Smart Dashboard - DigiNews Offline-First  
- **NIM Akhir:** 4 (Genap)  

---

## 🚀 Fitur Utama & Logika Anti-AI (NIM 20123074)

1. **Arsitektur & Dependency Injection:**
   - Pembagian layer terstruktur: **Domain**, **Data**, dan **Presentation**.
   - Navigasi dinamis menggunakan [GoRouter](https://pub.dev/packages/go_router).
   - Registrasi dependency menggunakan [GetIt](https://pub.dev/packages/get_it) sebagai Service Locator.

2. **Arsitektur Flavor (melalui `--dart-define`):**
   - **Flavor DEV:** Nama aplikasi di Android HP menjadi `"DEV - Wildan"`. Warna utama: Indigo (`#6366F1`).
   - **Flavor PROD:** Nama aplikasi di Android HP menjadi `"UTD - 20123074"`. Warna utama: **Biru Gelap** (`#0D1B2A`).

3. **Networking & State Management (Dio & BLoC):**
   - Menghubungkan aplikasi ke **Spaceflight News API v4** menggunakan client [Dio](https://pub.dev/packages/dio) yang dilengkapi Interceptor Logger.
   - Manajemen State diatur secara reaktif menggunakan [Flutter BLoC](https://pub.dev/packages/flutter_bloc) (`NewsLoading`, `NewsLoaded`, `NewsError`).
   - 🔥 **Logika Sorting NIM (Layer Repository):** Mengurutkan judul berita secara **Ascending (A ke Z)** di layer repository sebelum dipancarkan ke BLoC (syarat NIM genap).

4. **Database Reaktif & Animasi Lottie (Isar & Lottie):**
   - Caching offline reaktif menggunakan database [Isar](https://pub.dev/packages/isar). Data berita akan disimpan secara otomatis. Jika perangkat berada di mode Airplane, aplikasi akan memunculkan berita terakhir dari Isar.
   - 🔥 **Lottie Easter Egg (NIM 4):** Mengetuk foto profil pada halaman profil secara cepat sebanyak **4 kali** akan menampilkan animasi Lottie Confetti full-screen selama 3 detik.

5. **MethodChannel Native Kotlin:**
   - Mengirim string NIM `"20123074"` dari Dart ke Kotlin.
   - Di Kotlin (`MainActivity.kt`), membalikkan string NIM menjadi `"47032102"`.
   - Menampilkan Toast native Android dari Kotlin, mengembalikan hasil string ke Dart, dan menampilkannya di halaman profil.

6. **Automated Testing & CI/CD:**
   - Minimal 3 Unit Test menggunakan [Mocktail](https://pub.dev/packages/mocktail) yang menguji sorting A-Z repository dan state emisi BLoC.
   - Pipa integrasi **GitHub Actions** (`flutter_ci.yml`) yang melakukan pengujian otomatis dan membangun APK Release PROD.

---

## 🛠️ Cara Menjalankan & Membangun Aplikasi

### Menjalankan Mode Development (DEV)
```bash
flutter run --dart-define=FLAVOR=dev --dart-define=APP_NAME="DEV - Wildan"
```

### Menjalankan Mode Production (PROD)
```bash
flutter run --dart-define=FLAVOR=prod --dart-define=APP_NAME="UTD - 20123074"
```

### Membangun APK Release (PROD)
```bash
flutter build apk --release --dart-define=FLAVOR=prod --dart-define=APP_NAME="UTD - 20123074"
```
*Hasil APK akan tersedia di folder `build/app/outputs/flutter-apk/app-release.apk`.*

---

## 🧪 Hasil Automated Unit Tests
Jalankan pengujian menggunakan:
```bash
flutter test
```
*Seluruh pengujian unit (sorting repository A-Z, emisi state BLoC loading/loaded/error) telah lolos pengujian.*
