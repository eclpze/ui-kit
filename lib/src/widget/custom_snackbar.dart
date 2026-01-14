import 'package:flutter/material.dart';
import 'package:new_ui/src/typography.dart';

// Губайдуллина Камилла Рустемовна, создан 18.12.2026 19:25, информационное оповещение для использования в основном проекте
class CustomSnackBar {
  static void show({
    required BuildContext context, // Контекст для показа окна
    required String title, // Заголовок окна
    required String text, // Контент окна
    required Color colorSnackBar, // Цвет окна
    required double radius, // Закругление окна
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: colorSnackBar,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          title: Text(title, style: title2Semibold),
          content: Text(text, style: title2Semibold),
        );
      },
    );
  }
}
