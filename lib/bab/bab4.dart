import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Langkah 1: Buat Model untuk menampung state dan logika kalkulator.
// Model ini akan menggunakan ChangeNotifier untuk memberi tahu widget jika ada perubahan data.
class CalculatorModel extends ChangeNotifier {
  String _result = '0';
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  // Getter untuk mengakses data dari luar kelas
  String get result => _result;
  TextEditingController get controller1 => _controller1;
  TextEditingController get controller2 => _controller2;

  // Fungsi untuk melakukan operasi perhitungan
  void _calculate(String operation) {
    // Ambil nilai dari controller dan coba ubah ke double
    final double? num1 = double.tryParse(_controller1.text);
    final double? num2 = double.tryParse(_controller2.text);

    // Langkah 5: Penanganan error jika input bukan angka
    if (num1 == null || num2 == null) {
      _result = 'Input harus berupa angka!';
      notifyListeners(); // Beri tahu widget untuk update UI
      return;
    }

    // Lakukan perhitungan berdasarkan operasi yang dipilih
    switch (operation) {
      case '+':
        _result = (num1 + num2).toString();
        break;
      case '-':
        _result = (num1 - num2).toString();
        break;
      case 'x':
        _result = (num1 * num2).toString();
        break;
      case '/':
        // Langkah 5: Penanganan error pembagian dengan nol
        if (num2 == 0) {
          _result = 'Tidak bisa dibagi dengan nol!';
        } else {
          _result = (num1 / num2).toString();
        }
        break;
    }

    // Hapus .0 jika hasilnya adalah bilangan bulat (misal: 10.0 menjadi 10)
    if (_result.endsWith('.0')) {
      _result = _result.substring(0, _result.length - 2);
    }

    notifyListeners(); // Beri tahu widget untuk update UI setelah perhitungan selesai
  }

  // Metode publik yang akan dipanggil oleh tombol-tombol di UI
  void add() => _calculate('+');
  void subtract() => _calculate('-');
  void multiply() => _calculate('x');
  void divide() => _calculate('/');

  // Pastikan untuk membersihkan controller saat model tidak lagi digunakan
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}

// Fungsi main, titik masuk aplikasi
void main() {
  runApp(
    // Langkah 6: Gunakan ChangeNotifierProvider untuk menyediakan CalculatorModel
    // ke seluruh widget tree di bawahnya.
    ChangeNotifierProvider(
      create: (context) => CalculatorModel(),
      child: const SimpleCalculatorApp(),
    ),
  );
}

// Widget utama aplikasi
class SimpleCalculatorApp extends StatelessWidget {
  const SimpleCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const bab4page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Halaman utama kalkulator
class bab4page extends StatelessWidget {
  const bab4page({super.key});

  @override
  Widget build(BuildContext context) {
    // Gunakan Consumer untuk mendengarkan perubahan pada CalculatorModel dan membangun ulang UI
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana (Provider)'),
      ),
      body: Consumer<CalculatorModel>(
        builder: (context, calculator, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Langkah 2a: Dua TextField untuk input angka
                TextField(
                  controller: calculator.controller1,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Angka Pertama',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: calculator.controller2,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Angka Kedua',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24.0),

                // Langkah 2c: Text widget untuk menampilkan hasil
                Text(
                  'Hasil: ${calculator.result}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24.0),

                // Langkah 2b & 4: Tombol-tombol operasi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildOperationButton(context, '+', calculator.add),
                    _buildOperationButton(context, '-', calculator.subtract),
                    _buildOperationButton(context, 'x', calculator.multiply),
                    _buildOperationButton(context, '/', calculator.divide),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget helper untuk membuat tombol operasi agar kode tidak berulang
  Widget _buildOperationButton(BuildContext context, String operation, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: const CircleBorder(),
      ),
      child: Text(
        operation,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
