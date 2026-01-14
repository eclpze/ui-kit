import 'package:flutter/material.dart';
import 'package:new_ui/src/typography.dart';
import 'package:new_ui/src/widget/custom_bubble.dart';
import 'package:new_ui/src/widget/custom_icon.dart';

enum HeaderType { big, small }

// Губайдуллина Камилла Рустемовна, создан 23.12.2025 12:50, хэдер для использования в основном проекте
class CustomHeader extends StatelessWidget {
  final HeaderType type; // Тип хэдера
  final String textHeader; // Текст хэдера
  final String pathBubble; // Путь к иконке
  final double heightBubble; // Высота иконки
  final double widthBubble; // Ширина иконки
  final String pathIcon; // Путь к иконке
  final double heightIcon; // Высота иконки
  final double widthIcon; // Ширина иконки
  final VoidCallback onBubble; // Действие при нажатии на Bubble
  final VoidCallback onIcon; // Действие при нажатии на Icon
  final double horizontalPadding; // Горизонтальный отступ
  final double verticalPadding; // Вертикальный отступ

  const CustomHeader({
    super.key,
    this.type = HeaderType.big,
    required this.textHeader,
    required this.pathBubble,
    required this.heightBubble,
    required this.widthBubble,
    required this.pathIcon,
    required this.heightIcon,
    required this.widthIcon,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.onBubble,
    required this.onIcon,
  });

  @override
  Widget build(BuildContext context) {
    if (type == HeaderType.big) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CustomBubble(
                  pathBubble: pathBubble,
                  widthBubble: widthBubble,
                  heightBubble: heightBubble,
                  borderRadius: 12,
                  onPressed: onBubble,
                ),
                Spacer(),
                GestureDetector(
                  onTap: onIcon,
                  child: CustomIcon(
                    pathIcon: pathIcon,
                    widthIcon: widthIcon,
                    heightIcon: heightIcon,
                    paddingIcon: 0,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 24),
                Row(
                  children: [
                    Text(textHeader, style: title1ExtraBold),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Row(
          children: [
            CustomBubble(
              pathBubble: pathBubble,
              borderRadius: 6,
              widthBubble: widthBubble,
              heightBubble: heightBubble,
              onPressed: onBubble,
            ),
            Spacer(),
            Text(textHeader, style: title2Semibold),
            Spacer(),
            GestureDetector(
              onTap: onIcon,
              child: CustomIcon(
                pathIcon: pathIcon,
                widthIcon: widthIcon,
                heightIcon: heightIcon,
                paddingIcon: 0,
              ),
            ),
          ],
        ),
      );
    }
  }
}
