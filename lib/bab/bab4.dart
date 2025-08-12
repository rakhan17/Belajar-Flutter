import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Fungsi main, titik masuk aplikasi
void main() {
  runApp(
    // Langkah 1: Sediakan model ke seluruh aplikasi dengan ChangeNotifierProvider.
    // Ini adalah tempat terbaik untuk meletakkan Provider, yaitu di paling atas.
    ChangeNotifierProvider(
      create: (context) => CalculatorModel(),
      child: const MyApp(), // Child-nya adalah root widget aplikasi kita.
    ),
  );
}

// Widget root aplikasi kita.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp sekarang berada di DALAM Provider, jadi semua halaman
    // yang dibuat oleh MaterialApp bisa mengakses Provider tersebut.
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


// --- Class Model dan Halaman tidak perlu diubah ---

// Model untuk menampung state dan logika kalkulator.
class CalculatorModel extends ChangeNotifier {
  String _result = '0';
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String get result => _result;
  TextEditingController get controller1 => _controller1;
  TextEditingController get controller2 => _controller2;

  void _calculate(String operation) {
    final double? num1 = double.tryParse(_controller1.text);
    final double? num2 = double.tryParse(_controller2.text);

    if (num1 == null || num2 == null) {
      _result = 'Input harus berupa angka!';
      notifyListeners();
      return;
    }

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
        if (num2 == 0) {
          _result = 'Tidak bisa dibagi dengan nol!';
        } else {
          _result = (num1 / num2).toString();
        }
        break;
    }

    if (_result.endsWith('.0')) {
      _result = _result.substring(0, _result.length - 2);
    }

    notifyListeners();
  }

  void add() => _calculate('+');
  void subtract() => _calculate('-');
  void multiply() => _calculate('x');
  void divide() => _calculate('/');

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}

// Halaman utama kalkulator
class bab4page extends StatelessWidget {
  const bab4page({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer sekarang pasti bisa menemukan CalculatorModel karena posisinya sudah benar.
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
                Text(
                  'Hasil: ${calculator.result}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24.0),
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
