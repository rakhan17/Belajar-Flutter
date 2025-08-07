import 'package:flutter/material.dart';

// Contoh StatefulWidget sederhana
class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState(); // Membuat objek State
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0; // State yang dapat berubah

  void _incrementCounter() {
	setState(() {
	  // Metode setState() memberitahu Flutter untuk membangun ulang widget
	  _counter++;
	});
  }

  @override
  Widget build(BuildContext context) {
	return MaterialApp(
	  home: Scaffold(
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
				'$_counter', // Menampilkan state counter
				style: const TextStyle(
				  fontSize: 48,
				  fontWeight: FontWeight.bold,
				),
			  ),
			  const SizedBox(height: 20), // Memberi jarak
			  ElevatedButton(
				onPressed: _incrementCounter, // Memanggil fungsi untuk mengubah state
				child: const Text('Tambah'),
			  ),
			],
		  ),
		),
	  ),
	);
  }
}

void main() {
  runApp(const CounterApp());
}