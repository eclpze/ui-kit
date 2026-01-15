import 'package:flutter/material.dart';
import 'package:new_ui/src/color.dart';
import 'package:new_ui/src/typography.dart';
import 'package:new_ui/src/widget/custom_button.dart';
import 'package:new_ui/src/widget/custom_counter.dart';
import 'package:new_ui/src/widget/custom_icon.dart';

// Губайдуллина Камилла Рустемовна, создан 17.12.2025 17:23, карточка для использования в основном проекте

enum CardType { primary, cart, project }

class CustomCard extends StatefulWidget {
  final Color colorCard; // Цвет карты
  final CardType type; // Тип карты
  final String title; // Заголовок карты
  final double widthTitle; // Ширина заголовка
  final String? category; // Категория товара
  final String? price; // Цена товара
  final String? count; // Количество товаров
  final String? day; // Параметр для карточки с данными проекта
  final String? textButton; // Текст кнопки
  final String? secondaryText; // Текст второй кнопки
  final VoidCallback? secondaryPressed; // Действие при нажатии на кнопку
  final VoidCallback? onPressed; // Действие при нажатии на кнопку
  final VoidCallback? onIcon; // Действие при нажатии на иконку
  final VoidCallback? onPlus; // Действие при нажатии на плюс
  final VoidCallback? onMinus; // Действие при нажатии на минус
  final double paddingCard; // Внутренние отступы
  final bool? inCart; //

  const CustomCard({
    super.key,
    required this.colorCard,
    required this.type,
    required this.title,
    required this.widthTitle,
    required this.paddingCard,
    this.onPressed,
    this.count,
    this.onIcon,
    this.onPlus,
    this.onMinus,
    this.category,
    this.price,
    this.textButton,
    this.day,
    this.secondaryText,
    this.secondaryPressed,
    this.inCart,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.type == CardType.primary) {
      return Card(
        color: widget.colorCard,
        child: Container(
          padding: EdgeInsets.all(widget.paddingCard),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: widget.widthTitle,
                child: Text(widget.title, style: headlineMedium),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.category!,
                        style: captionSemibold.copyWith(color: caption),
                      ),
                      SizedBox(height: 5),
                      Text(widget.price!, style: title3Semibold),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    type: widget.inCart!
                        ? ButtonType.secondary
                        : ButtonType.primary,
                    widthButton: 115,
                    heightButton: 40,
                    borderRadius: 10,
                    elevationButton: 0,
                    textButton: widget.inCart!
                        ? widget.secondaryText!
                        : widget.textButton!,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    onPressed: widget.inCart!
                        ? widget.secondaryPressed!
                        : widget.onPressed!,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    if (widget.type == CardType.cart) {
      return Card(
        color: widget.colorCard,
        child: Container(
          padding: EdgeInsets.all(widget.paddingCard),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: widget.widthTitle,
                    child: Text(widget.title, style: headlineMedium),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: widget.onIcon,
                    child: CustomIcon(
                      pathIcon: 'assets/close.svg',
                      widthIcon: 20,
                      heightIcon: 20,
                      paddingIcon: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  if (widget.price != null)
                    Text(widget.price!, style: title3Semibold),
                  Spacer(),
                  if (widget.count != null)
                    Text(widget.count!, style: textRegular),
                  SizedBox(width: 40),
                  CustomCounter(
                    widthCounter: 64,
                    heightCounter: 32,
                    radiusCounter: 8,
                    colorCounter: input_bg,
                    paddingCounter: 6,
                    onPlus: widget.onPlus ?? () {},
                    onMinus: widget.onMinus ?? () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        color: widget.colorCard,
        child: Container(
          padding: EdgeInsets.all(widget.paddingCard),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: widget.widthTitle,
                child: Text(widget.title, style: headlineMedium),
              ),
              SizedBox(height: 45),
              Row(
                children: [
                  if (widget.day != null)
                    Text(
                      widget.day!,
                      style: headlineMedium.copyWith(color: caption),
                    ),
                  Spacer(),
                  SizedBox(width: 30),
                  CustomButton(
                    type: ButtonType.primary,
                    widthButton: 115,
                    heightButton: 40,
                    borderRadius: 10,
                    elevationButton: 0,
                    textButton: widget.textButton!,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    onPressed: widget.onPressed ?? () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
