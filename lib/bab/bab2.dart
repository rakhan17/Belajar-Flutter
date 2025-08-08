import 'package:flutter/material.dart';

// Class diubah menjadi Bab2Page dan hanya mengembalikan Scaffold
class Bab2Page extends StatefulWidget {
  const Bab2Page({super.key});

  @override
  State<Bab2Page> createState() => _Bab2PageState();
}

class _Bab2PageState extends State<Bab2Page> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Anda telah menekan tombol sebanyak:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: incrementCounter,
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}