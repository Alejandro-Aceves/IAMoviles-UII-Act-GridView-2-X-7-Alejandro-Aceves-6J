import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const ToursScreen(),
    );
  }
}

// 1. Modelo de datos para facilitar la edición
class Tour {
  final String title;
  final String price;
  final String imageUrl;
  final int stars;

  Tour({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.stars,
  });
}

class ToursScreen extends StatelessWidget {
  const ToursScreen({super.key});

  final Color primaryGreen = const Color(0xFF3CB67B);

  @override
  Widget build(BuildContext context) {
    // 2. Aquí están tus 14 elementos listos para ser editados
    final List<Tour> toursData = [
      Tour(title: "París", price: "\$1,200", stars: 5, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/paris.jpeg"),
      Tour(title: "Londres", price: "\$1,100", stars: 4, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/londres.jpeg"),
      Tour(title: "Roma", price: "\$950", stars: 5, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/roma.jpeg"),
      Tour(title: "Madrid", price: "\$800", stars: 4, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/madrid.jpeg"),
      Tour(title: "Tokio", price: "\$2,500", stars: 5, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/tokio.jpeg"),
      Tour(title: "Nueva York", price: "\$1,800", stars: 4, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/NuevaYork.jpg"),
      Tour(title: "Barcelona", price: "\$850", stars: 5, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/barcelona.jpeg"),
      Tour(title: "Cancún", price: "\$600", stars: 4, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/cancun.jpeg"),
      Tour(title: "Berlín", price: "\$900", stars: 3, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/berlin.jpeg"),
      Tour(title: "Ámsterdam", price: "\$1,050", stars: 5, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/amsterdam.jpeg"),
      Tour(title: "Venecia", price: "\$1,300", stars: 4, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/venecia.jpeg"),
      Tour(title: "Praga", price: "\$750", stars: 4, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/praga.jpeg"),
      Tour(title: "Dubái", price: "\$3,000", stars: 5, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/dubai.jpeg"),
      Tour(title: "Lisboa", price: "\$700", stars: 4, imageUrl: "https://raw.githubusercontent.com/Alejandro-Aceves/Imagenes-Para-Flutter-Alejandro-Aceves-6J-11-FEB-2026/refs/heads/main/lisboa.jpeg"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tours',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryGreen,
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: toursData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 20,
          childAspectRatio: 0.7, // Ajustado para dar más espacio al texto
        ),
        itemBuilder: (context, index) {
          final tour = toursData[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(tour.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Ciudad
              Text(
                tour.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              // Precio
              Text(
                tour.price,
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              // Estrellas dinámicas
              Row(
                children: List.generate(5, (starIndex) {
                  return Icon(
                    Icons.star,
                    size: 16,
                    color: starIndex < tour.stars ? Colors.amber : Colors.grey[300],
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}