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
      // Enhanced AppBar
      appBar: AppBar(
        title: const Text(
          'Welkam Loh Rekkkk🫦💋😘',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
<<<<<<< HEAD
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'bab3');
              },
              child: const Text('número tres'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 18),
=======
        elevation: 8.0,
    ),

      // Gradient Background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 148, 217, 183), Colors.green],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Chapter 3 Button
              _buildChapterButton(
                context: context,
                route: 'bab3',
                colors: [const Color.fromARGB(255, 244, 230, 106), const Color.fromARGB(255, 170, 170, 0) ],
                text: 'Menuju Bab 3',
              ),

              const SizedBox(height: 30),

              // Chapter 4 Button
              _buildChapterButton(
                context: context,
                route: 'bab4',
                colors: [Colors.purpleAccent, Colors.deepPurple],
                text: 'Menuju Bab 4',
>>>>>>> 536a854af7c5b41c4860cf76cf9ba23bad58e367
              ),

              const SizedBox(height: 30),

              // Helper Text
              const Text(
                'Pilih Bab yang Ingin Dipelajari',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Button Widget
  Widget _buildChapterButton({
    required BuildContext context,
    required String route,
    required List<Color> colors,
    required String text,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, route),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
<<<<<<< HEAD
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'bab5');
              },
              child: const Text('número cinco'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'bab6');
              },
              child: const Text('número seis'),
            ),
          ],
=======
          ),
>>>>>>> 536a854af7c5b41c4860cf76cf9ba23bad58e367
        ),
      ),
    );
  }
}
