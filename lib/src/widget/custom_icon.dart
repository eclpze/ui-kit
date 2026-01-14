import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Губайдуллина Камилла Рустемовна, создан 17.12.2025 17:10, иконка с поддержанием SVG-формата для использования в основном проекте
class CustomIcon extends StatelessWidget {
  final String pathIcon; // Путь к иконке
  final double widthIcon; // Ширина иконки
  final double heightIcon; // Высота иконки
  final double paddingIcon; // Отступы иконки
  final Color? colorIcon; // Цвет иконки

  const CustomIcon({
    super.key,
    required this.pathIcon,
    required this.widthIcon,
    required this.heightIcon,
    required this.paddingIcon,
    this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingIcon),
      child: SvgPicture.asset(
        pathIcon,
        height: heightIcon,
        width: widthIcon,
        color: colorIcon!,
      ),
    );
  }
}
