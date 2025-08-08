// ...............

import 'package:flutter/material.dart';
import 'bab/bab1.dart';
import 'bab/bab2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'bab2',
      routes: {
  '/bab1': (context) => const Bab1Page(),   // <-- Nama baru yang benar
  '/bab2': (context) => const Bab2Page(),   // <-- Nama baru yang benar
      },
    );
  }
}