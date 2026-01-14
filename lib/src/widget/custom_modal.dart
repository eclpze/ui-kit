import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:new_ui/src/color.dart';
import 'package:new_ui/src/typography.dart';
import 'package:new_ui/src/widget/custom_button.dart';
import 'package:new_ui/src/widget/custom_icon.dart';

// Губайдуллина Камилла Рустемовна, создан 18.12.2025 10:57, модальное окно для использования в основном проекте

class CustomModal {
  static void show({
    required BuildContext context, // Контекст для покаpа модального окна
    required String titleModal, // Заголовок окна
    required double widthTitle, // Ширина для текста
    required String contentModal, // Описание
    required String content2Modal, // Примерный расход
    required String textButton, // Текст для кнопки
    required Color backgroundColor, // Фон окна
    required double radiusLeft, // Левое закругление
    required double radiusRight, // Правое закругление
    required double paddingModal, // Внутренние отступы
    required VoidCallback onPressed, // Действие при нажатии
    required String? pathIcon, // Путь иконки
    required String? text1, // Дополнительный текст
    required String? text2, // Дополнительный текст
  }) {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusLeft),
          topRight: Radius.circular(radiusRight),
        ),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(paddingModal),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: widthTitle,
                  child: Text(titleModal, style: title2Semibold),
                ),
                Spacer(),
                GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    height: 24,
                    width: 24,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: input_stroke,
                    ),
                    child: CustomIcon(
                      pathIcon: pathIcon!,
                      widthIcon: 20,
                      heightIcon: 20,
                      paddingIcon: 0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(text1!, style: headlineMedium.copyWith(color: caption)),
            SizedBox(height: 10),
            Text(contentModal, style: headlineRegular),
            SizedBox(height: 45),
            Text(text2!, style: headlineMedium.copyWith(color: caption)),
            SizedBox(height: 10),
            Text(content2Modal, style: headlineMedium),
            SizedBox(height: 20),
            Center(
              child: CustomButton(
                type: ButtonType.primary,
                widthButton: 335,
                heightButton: 56,
                borderRadius: 8,
                elevationButton: 0,
                textButton: textButton,
                fontWeight: FontWeight.w700,
                fontSize: 17,
                onPressed: () {
                  {}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
