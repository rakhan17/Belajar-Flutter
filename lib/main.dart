import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // <-- JANGAN LUPA IMPORT INI
import 'bab/bab3.dart';
import 'bab/bab4.dart';

// Import model kalkulator Anda jika berada di file terpisah
// Jika CalculatorModel ada di dalam bab4.dart, import bab4.dart sudah cukup.

void main() {
  runApp(
    // Bungkus seluruh aplikasi dengan Provider
    ChangeNotifierProvider(
      create: (context) => CalculatorModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Anda bisa menentukan halaman awal di sini
      // atau biarkan Provider yang menampilkannya via 'home' di bawah
      initialRoute: 'bab3',
      routes: {
        'bab3': (context) => const Bab3Page(),
        // Sekarang, saat rute 'bab4' dipanggil, Provider sudah ada di atasnya
        'bab4': (context) => const Bab4Page(),
      },
    );
  }
}