import 'package:flutter/material.dart';

// Губайдуллина Камилла Рустемовна, создан 14.01.2026 10:06, изображение для использования в основном проекте
// cached_network_image: ^3.4.1
class CustomImage extends StatelessWidget {
  final String pathImage; // Путь к изображению
  final double width; // Ширина изображения
  final double height; // Высота изображения

  const CustomImage({super.key, required this.pathImage, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(pathImage, height: height, width: width);
  }
}
