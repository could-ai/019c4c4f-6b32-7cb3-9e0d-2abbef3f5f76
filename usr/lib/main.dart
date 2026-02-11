import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/apply_screen.dart';

void main() {
  runApp(const MarriageCertificateApp());
}

class MarriageCertificateApp extends StatelessWidget {
  const MarriageCertificateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marriage Certificate Services',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E), // Deep Indigo for official look
          primary: const Color(0xFF1A237E),
          secondary: const Color(0xFFC5CAE9),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Standard web font
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.grey[50],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: const Color(0xFF1A237E),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/apply': (context) => const ApplyScreen(),
      },
    );
  }
}
