// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_7/pages/input_page.dart';

void main() {
  // Alur dimulai dari MyApp, yang menyiapkan tema lalu membuka halaman input BMR.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Menyediakan konfigurasi global aplikasi dan halaman pertama yang ditampilkan.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMR Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      home: const InputPage(),
    );
  }
}
