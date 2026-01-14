import 'package:flutter/material.dart';
import 'package:new_ui/src/widget/custom_icon.dart';

// Губайдуллина Камилла Рустемовна, создан 18.12.2025 10:47, счетчик для использования в основном проекте
class CustomCounter extends StatelessWidget {
  final double widthCounter; // Ширина счетчика
  final double heightCounter; // Высота счетчика
  final double radiusCounter; // Закругление счетчика
  final Color colorCounter; // Цвет счетчика
  final double paddingCounter; // Внутренние отступы
  final VoidCallback onPlus; // Действие при нажатии на плюс
  final VoidCallback onMinus; // Действие при нажатии на минус

  const CustomCounter({
    super.key,
    required this.widthCounter,
    required this.heightCounter,
    required this.radiusCounter,
    required this.colorCounter,
    required this.paddingCounter,
    required this.onPlus,
    required this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthCounter,
      height: heightCounter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radiusCounter)),
        color: colorCounter,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingCounter),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onMinus,
              child: CustomIcon(
                pathIcon: 'assets/minus.svg',
                widthIcon: 20,
                heightIcon: 20,
                paddingIcon: 0,
              ),
            ),
            CustomIcon(
              pathIcon: 'assets/divider.svg',
              widthIcon: 16,
              heightIcon: 16,
              paddingIcon: 0,
            ),
            GestureDetector(
              onTap: onPlus,
              child: CustomIcon(
                pathIcon: 'assets/plus.svg',
                widthIcon: 20,
                heightIcon: 20,
                paddingIcon: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
