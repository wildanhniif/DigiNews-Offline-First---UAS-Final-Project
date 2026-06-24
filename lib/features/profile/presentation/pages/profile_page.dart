import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/config/env_config.dart';
import '../../../../core/config/student_config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // MethodChannel setup
  static const _channel = MethodChannel('utd.ac.id/native_jembatan');
  
  String _reversedNim = "-";
  bool _isLoadingNative = false;

  // Easter Egg setup
  int _tapCount = 0;
  DateTime? _lastTapTime;
  bool _showEasterEgg = false;
  Timer? _easterEggTimer;

  // Fungsi memanggil MethodChannel Native Kotlin
  Future<void> _invokeNativeReverseNIM() async {
    setState(() {
      _isLoadingNative = true;
    });

    try {
      final String nim = StudentConfig.studentNim;
      // Kirim NIM ke Kotlin, tangkap kembalian string terbalik
      final String result = await _channel.invokeMethod('reverseNIM', {'nim': nim});
      
      setState(() {
        _reversedNim = result;
      });
    } on PlatformException catch (e) {
      debugPrint("MethodChannel Error: ${e.message}");
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal memanggil native: ${e.message}")),
      );
    } finally {
      setState(() {
        _isLoadingNative = false;
      });
    }
  }

  // Deteksi ketukan cepat sebanyak 4 kali
  void _onProfileImageTap() {
    final now = DateTime.now();
    const int targetTaps = 4; // Digit terakhir NIM 20123074 = 4

    if (_lastTapTime == null || now.difference(_lastTapTime!) > const Duration(seconds: 2)) {
      // Reset jika terlalu lambat
      _tapCount = 1;
      _lastTapTime = now;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ketuk ${targetTaps - _tapCount} kali lagi secara cepat untuk memicu Easter Egg!"),
          duration: const Duration(milliseconds: 800),
        ),
      );
    } else {
      _tapCount++;
      _lastTapTime = now;

      if (_tapCount < targetTaps) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Ketuk ${targetTaps - _tapCount} kali lagi secara cepat!"),
            duration: const Duration(milliseconds: 800),
          ),
        );
      }

      if (_tapCount == targetTaps) {
        _triggerEasterEgg();
      }
    }
  }

  void _triggerEasterEgg() {
    _easterEggTimer?.cancel();
    setState(() {
      _showEasterEgg = true;
      _tapCount = 0;
      _lastTapTime = null;
    });

    // Sembunyikan setelah 3 detik
    _easterEggTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showEasterEgg = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _easterEggTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = EnvConfig.primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Mahasiswa"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                // Foto Profil dengan GestureDetector untuk Easter Egg
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 148,
                        height: 148,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor.withValues(alpha: 0.1),
                          border: Border.all(color: primaryColor, width: 3),
                        ),
                      ),
                      GestureDetector(
                        onTap: _onProfileImageTap,
                        child: Hero(
                          tag: 'profile-avatar',
                          child: CircleAvatar(
                            radius: 68,
                            backgroundColor: primaryColor.withValues(alpha: 0.2),
                            child: Icon(
                              Icons.face_rounded,
                              size: 96,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Ketuk foto profil 4x secara cepat!",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Informasi Detail Mahasiswa (Premium Card)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(context, "Nama Lengkap", StudentConfig.studentName, Icons.person),
                        const Divider(height: 24),
                        _buildInfoRow(context, "NIM", StudentConfig.studentNim, Icons.badge),
                        const Divider(height: 24),
                        _buildInfoRow(context, "Tema UAS", "DigiNews Offline-First", Icons.topic),
                        const Divider(height: 24),
                        _buildInfoRow(context, "Kelas", "Mobile Lanjut - UAS", Icons.school),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Integrasi Native MethodChannel Card
                Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.android_rounded, color: Colors.green.shade700),
                            const SizedBox(width: 8),
                            Text(
                              "Integrasi Kotlin Native",
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.green.shade900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Mengirim NIM '${StudentConfig.studentNim}' ke Native Android Kotlin untuk dibalikkan susunannya.",
                          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: _isLoadingNative ? null : _invokeNativeReverseNIM,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade700,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: _isLoadingNative
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                )
                              : const Icon(Icons.swap_horizontal_circle_rounded),
                          label: const Text("Kirim NIM ke Kotlin"),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "NIM Dibalik (Kotlin):",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
                              ),
                              Text(
                                _reversedNim,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.green.shade800,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          
          // Secret Easter Egg Overlay (Confetti Lottie)
          if (_showEasterEgg)
            Container(
              color: Colors.black.withValues(alpha: 0.7),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Lottie.asset(
                      'assets/animations/easter_egg.json',
                      repeat: false,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 48.0),
                    child: Column(
                      children: [
                        Text(
                          "🥚 EASTER EGG TERBUKA! 🥚",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Logika NIM Sukses Tervalidasi!",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value, IconData icon) {
    final theme = Theme.of(context);
    final primaryColor = EnvConfig.primaryColor;

    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: primaryColor.withValues(alpha: 0.08),
          child: Icon(icon, color: primaryColor, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
