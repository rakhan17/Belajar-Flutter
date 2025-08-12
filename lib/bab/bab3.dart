import 'package:flutter/material.dart';

class Bab3Page extends StatelessWidget { // <-- Nama class diubah
  const Bab3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // <-- Langsung kembalikan Scaffold
      appBar: AppBar(
        title: const Text('Stateless Widget Example'),
      ),
      body: const Center(
        child: Text(
          'Saya adalah Stateless Widget!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}