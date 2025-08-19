import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List<Map<String, String>> photos = [
    {'title': 'Mongkrang', 'url': 'https://picsum.photos/id/10/400/400'},
    {'title': 'Day 1 Belajar', 'url': 'https://picsum.photos/id/20/400/400'},
    {'title': 'Cangkul', 'url': 'https://picsum.photos/id/23/400/400'},
    {'title': 'Ini Hideung', 'url': 'https://picsum.photos/id/40/400/400'},
    {'title': 'Arab', 'url': 'https://picsum.photos/id/46/400/400'},
    {'title': 'Air', 'url': 'https://picsum.photos/id/41/400/400'},
    {'title': 'Jalan Raya', 'url': 'https://picsum.photos/id/70/400/400'},
    {'title': 'Ngopi', 'url': 'https://picsum.photos/id/42/400/400'},
    {'title': 'gatau ini apa', 'url': 'https://picsum.photos/id/90/400/400'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ceritanya Galeri💪🏿'),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          final photo = photos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetailScreen(
                    title: photo['title']!,
                    url: photo['url']!,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4.0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black45,
                  title: Text(photo['title']!),
                ),
                child: Image.network(photo['url']!, fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Halaman untuk menampilkan detail foto yang dipilih
class PhotoDetailScreen extends StatelessWidget {
  final String title;
  final String url;

  const PhotoDetailScreen({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.green),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(url),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
