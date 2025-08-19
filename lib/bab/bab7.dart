import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 3. Membuat kelas model Photo sesuai struktur JSON
class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  // Factory constructor untuk membuat instance Photo dari map JSON
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

// Fungsi untuk mengambil data foto dari API
Future<List<Photo>> fetchPhotos() async {
  // 2. Menggunakan API publik dari JSONPlaceholder
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Selalu periksa response.statusCode
  if (response.statusCode == 200) {
    // Jika server mengembalikan respons OK, parse JSON.
    List<dynamic> body = jsonDecode(response.body);
    List<Photo> photos = body
        .map(
          (dynamic item) => Photo.fromJson(item),
        )
        .toList();
    return photos;
  } else {
    // Jika respons tidak OK, lempar exception.
    throw Exception('Gagal memuat foto');
  }
}

// Halaman utama untuk Bab 7, menampilkan daftar foto
class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  late Future<List<Photo>> futurePhotos;

  @override
  void initState() {
    super.initState();
    futurePhotos = fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Foto'),
        backgroundColor: Colors.blue,
      ),
      // 4. Menggunakan FutureBuilder untuk menangani state asynchronous
      body: Center(
        child: FutureBuilder<List<Photo>>(
          future: futurePhotos,
          builder: (context, snapshot) {
            // 4a. Menampilkan CircularProgressIndicator saat data sedang dimuat
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } 
            // 4b. Menampilkan pesan error jika terjadi kegagalan
            else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } 
            // 4c. Jika data berhasil dimuat, tampilkan daftar foto
            else if (snapshot.hasData) {
              // Pastikan data tidak null sebelum diakses
              final photos = snapshot.data!;
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Menampilkan 2 kolom
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  final photo = photos[index];
                  // 5. Menambahkan fungsionalitas onTap
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoDetailScreen(photo: photo),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Menampilkan thumbnail
                          Expanded(
                            child: Image.network(
                              photo.thumbnailUrl,
                              // Tambahkan header untuk menghindari beberapa masalah pemblokiran
                              headers: const {'User-Agent': 'Mozilla/5.0'},
                              fit: BoxFit.cover,
                              // Menampilkan loading indicator untuk setiap gambar
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(child: CircularProgressIndicator());
                              },
                              // Menampilkan icon error jika gambar gagal dimuat
                              errorBuilder: (context, error, stackTrace) {
                                // Tampilkan pesan error yang lebih informatif di console
                                print('Error memuat gambar: $error');
                                return const Tooltip(
                                  message: 'Gagal memuat gambar',
                                  child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                                );
                              },
                            ),
                          ),
                          // Menampilkan title
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              photo.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } 
            // State default jika tidak ada data
            else {
              return const Text('Tidak ada foto ditemukan.');
            }
          },
        ),
      ),
    );
  }
}

// 6. Halaman detail untuk menampilkan gambar ukuran penuh dan title
class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Menampilkan title dari foto yang dipilih
        title: Text(
          photo.title,
          style: const TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Menampilkan gambar ukuran penuh
          child: Image.network(
            photo.url,
            // Tambahkan header untuk menghindari beberapa masalah pemblokiran
            headers: const {'User-Agent': 'Mozilla/5.0'},
            // Menampilkan loading indicator saat gambar besar dimuat
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            // Menampilkan pesan error jika gambar gagal dimuat
            errorBuilder: (context, error, stackTrace) {
              print('Error memuat gambar detail: $error');
              return const Text('Gagal memuat gambar.');
            },
          ),
        ),
      ),
    );
  }
}
