import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ui/src/color.dart';

// Губайдуллина Камилла Рустемовна, создан 23.12.2025 12:53, кнопка с иконкой для использования в основном проекте
class CustomBubble extends StatelessWidget {
  final String pathBubble; // Путь к иконке
  final double widthBubble; // Ширина иконки
  final double heightBubble; // Высота иконки
  final double borderRadius; // Закругление фона
  final VoidCallback onPressed; // Действие при нажатии

  const CustomBubble({
    super.key,
    required this.pathBubble,
    required this.borderRadius,
    required this.widthBubble,
    required this.heightBubble,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: input_bg,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          pathBubble,
          height: heightBubble,
          width: widthBubble,
        ),
      ),
    );
  }
}
