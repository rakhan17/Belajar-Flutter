import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bab/bab3.dart';
import 'bab/bab4.dart';
import 'bab/bab5.dart';
import 'bab/bab6.dart';

void main() {
  runApp(
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
      title: 'Aplikasi Edukasi',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'bab3': (context) => const Bab3Page(),
        'bab4': (context) => const Bab4Page(),
        'bab5': (context) => const ProductListScreen(),
        'bab6': (context) => const GalleryPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welkam Loh Rekkkk🫦💋😘'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          // Agar bisa di-scroll jika tombol banyak
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Tombol Bab 3
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'bab3'),
                child: const Text('Bab 3: Kartu Profil'),
              ),
              const SizedBox(height: 20),

              // Tombol Bab 4
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'bab4'),
                child: const Text('Bab 4: Kalkulator'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: () => Navigator.pushNamed(context, 'bab5'),
                child: const Text('Bab 5: Katalog Produk'),
              ),
              const SizedBox(height: 20),

              // Tombol Bab 6
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => Navigator.pushNamed(context, 'bab6'),
                child: const Text('Bab 6: Galeri Foto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
