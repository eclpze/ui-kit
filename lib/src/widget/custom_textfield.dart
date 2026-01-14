import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_ui/src/color.dart';
import 'package:new_ui/src/typography.dart';
import 'package:new_ui/src/widget/custom_icon.dart';

// Губайдуллина Камилла Рустемовна, создан 13.01.2026 13:17, текстовое поле для ввода данных в основном проекте
enum TextFieldType { text, password, data }

class CustomTextField extends StatefulWidget {
  final TextFieldType type; // Тип текстового поля
  final TextInputType keyboardType; // Тип вводимых данных
  final TextEditingController controller; // Контроллер
  final Color color; // Фон поля
  final double borderRadius; // Закругление
  final Color borderColor; // Цвет границ
  final Color focusColor; // Цвет границ при фокусе
  final Color errorColor; // Цвет при ошибке
  final Color cursorColor; // Цвет курсора
  final String hintText; // Текст поля
  final String title; // Заголовок
  final bool haveTitle; // Переменная для показа заголовка
  final double paddingTitle; // Отступы заголовка
  final double paddingTextField; // Отступы текстового поля
  final String? errorText; // Ошибка

  const CustomTextField({
    super.key,
    required this.type,
    required this.controller,
    required this.title,
    required this.haveTitle,
    required this.paddingTitle,
    required this.paddingTextField,
    required this.color,
    required this.errorColor,
    required this.borderColor,
    required this.focusColor,
    required this.cursorColor,
    required this.hintText,
    required this.keyboardType,
    required this.borderRadius,
    this.errorText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    return Column(
      children: [
        if (widget.haveTitle)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.paddingTitle),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: captionRegular.copyWith(color: description),
                ),
              ],
            ),
          ),
        SizedBox(height: widget.haveTitle ? 15 : 0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.paddingTextField),
          child: TextField(
            controller: widget.controller,
            cursorColor: widget.cursorColor,
            keyboardType: widget.keyboardType,
            obscureText: widget.type == TextFieldType.password
                ? obscureText
                : false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: textRegular.copyWith(color: caption),
              filled: true,
              fillColor: hasError ? error_textfield : widget.color,
              suffixIcon: widget.type == TextFieldType.password
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: obscureText
                          ? CustomIcon(
                              pathIcon: 'assets/close_password.svg',
                              widthIcon: 20,
                              heightIcon: 20,
                              paddingIcon: 0,
                            )
                          : CustomIcon(
                              pathIcon: 'assets/open.svg',
                              widthIcon: 20,
                              heightIcon: 20,
                              paddingIcon: 0,
                            ),
                    )
                  : null,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: hasError ? error : widget.borderColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: hasError ? error : widget.borderColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: hasError ? error : widget.focusColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        if (hasError)
          Row(
            children: [
              SizedBox(width: widget.paddingTextField),
              Text(
                widget.errorText!,
                style: captionRegular.copyWith(color: error),
              ),
            ],
          ),
      ],
    );
  }
}
