import 'package:flutter/material.dart';

// Губайдуллина Камилла Рустемовна, создан 23.12.2025 17:12, разделитель для использования в основном проекте
class CustomDivider extends StatelessWidget {
  final Color colorDivider; // Цвет разделителя
  final double heightDivider; //  Высота разделителя
  final double thicknessDivider; // Толщина разделителя

  const CustomDivider({
    super.key,
    required this.colorDivider,
    required this.heightDivider,
    required this.thicknessDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: colorDivider,
      height: heightDivider,
      thickness: thicknessDivider,
    );
  }
}
