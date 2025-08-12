// ...............

import 'package:flutter/material.dart';
import 'bab/bab3.dart';
import 'bab/bab4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'bab3',
      routes: {
  'bab3': (context) => const Bab3Page(),
  'bab4': (context) => const bab4page(),
      },
    );
  }
}