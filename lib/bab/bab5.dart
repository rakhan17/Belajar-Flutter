import 'package:flutter/material.dart';

// Membuat class Product untuk menampung data agar lebih terstruktur
class Product {
  final String name;
  final String price;
  final String description;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

// Halaman 1: Menampilkan daftar semua produk
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Data produk hardcode menggunakan List<Product> dengan item yang lebih lucu dan trendy
  final List<Product> products = [
    Product(
      name: 'Kucing Kokekab',
      price: 'Rp 20.0000',
      description: 'Bakekok',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwt7BB2T1KC1aW1t0McqUNrErqUX6SZATYCw&s',
    ),
    Product(
      name: 'Speaker "Thomas Alva Edisi Sound"',
      price: 'Rp Goceng (Beneran)',
      description:
          'Speaker legendaris yang suaranya bisa bikin nostalgia zaman baheula. Kualitas suara seadanya, yang penting nyala.',
      imageUrl:
          'https://assets.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p3/163/2025/07/26/20250726_1147221-187266813.jpg',
    ),
    Product(
      name: 'Jesus Maman',
      price: 'Rp 2.000',
      description:
          'Jesus Maman, minuman legendaris yang bikin kamu merasa dekat dengan surga. Rasanya? Ya gitu deh, yang penting bisa diminum.',
      imageUrl:
          'https://i.ytimg.com/vi/b6GqCB_xucU/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBm_U3Ynq-MkZjS-YbNY5wSCbAe0A',
    ),
    Product(
      name: 'Tiket Nonton "Merah Putih One For All"',
      price: 'Rp 6,7 Miliar (Diskon Pelajar)',
      description:
          'Dengan grafik yang menyamai kehidupan nyata. Ikuti keseruan tim merdeka bersama Film One For All yang epik.',
      imageUrl:
          'https://awsimages.detik.net.id/community/media/visual/2025/08/11/merah-putih-one-for-all-1754882917408_43.jpeg?w=600&q=90',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nit Moaniy for Te'el Rek"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product.imageUrl,
                  width: 80,
                  fit: BoxFit.cover,
                  // Menambahkan error builder jika gambar gagal dimuat
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              title: Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                product.price,
                style: const TextStyle(color: Colors.deepOrange),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Halaman 2: Menampilkan detail dari satu produk
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name), backgroundColor: Colors.indigo),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                product.imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: Center(
                      child: Text(
                        'Gambar tidak tersedia',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product.price,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.deepOrange,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali ke Daftar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
