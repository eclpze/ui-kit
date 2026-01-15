import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_ui/src/color.dart';
import 'package:new_ui/src/typography.dart';
import 'package:new_ui/src/widget/custom_icon.dart';

// Губайдуллина Камилла Рустемовна, создан 16.12.2025 17:10, кнопка для использования в основном проекте
enum ButtonType { primary, inactive, secondary, tetriary, cart, login, chips }

class CustomButton extends StatefulWidget {
  final ButtonType type; // Тип кнопки
  final Color? background; // Цвет текста
  final Color? colorText; //
  final double widthButton; // Ширина кнопки
  final double heightButton; // Высота кнопки
  final double borderRadius; // Закругление кнопки
  final double elevationButton; // Тень
  final String textButton; // Текст кнопки
  final String? price; // Текст кнопки
  final FontWeight fontWeight; // Толщина текста
  final double fontSize; // Зазмер текста
  final VoidCallback onPressed; // Действие при нажатии
  final String? iconButton; // Иконка кнопки
  final bool? isSelected; // Изменение состояния chips

  const CustomButton({
    super.key,
    required this.type,
    required this.widthButton,
    required this.heightButton,
    required this.borderRadius,
    required this.elevationButton,
    required this.textButton,
    required this.fontWeight,
    required this.fontSize,
    required this.onPressed,
    this.price,
    this.iconButton,
    this.isSelected = false, this.background, this.colorText,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  Color _getColor() {
    if (widget.type == ButtonType.primary && widget.type == ButtonType.cart) return accent;
    if (widget.type == ButtonType.inactive) return accent_inactive;
    if (widget.type == ButtonType.secondary) return white;
    return input_bg;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == ButtonType.cart) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          ),
          minimumSize: Size(widget.widthButton, widget.heightButton),
          fixedSize: Size(widget.widthButton, widget.heightButton),
          elevation: widget.elevationButton,
          backgroundColor: _getColor(),
          enableFeedback: true,
        ),
        onPressed: widget.onPressed,
        child: Row(
          children: [
            CustomIcon(
              pathIcon: widget.iconButton!,
              widthIcon: 20,
              heightIcon: 20,
              paddingIcon: 0,
            ),
            SizedBox(width: 16),
            Text(
              widget.textButton,
              overflow: TextOverflow.ellipsis,
              style: title3Semibold.copyWith(color: white),
            ),
            Spacer(),
            if (widget.price != null)
              Text(
                widget.price!,
                style: title3Semibold.copyWith(color: white),
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      );
    }
    if (widget.type == ButtonType.chips) {
      return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          ),
          minimumSize: Size(widget.widthButton, widget.heightButton),
          enableFeedback: true,
          elevation: widget.elevationButton,
          backgroundColor: widget.isSelected! ? widget.background : input_bg,
        ),
        child: Text(
          widget.textButton,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.roboto(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.isSelected! ? widget.colorText : description,
          ),
        ),
      );
    }
    if (widget.type == ButtonType.login) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          ),
          minimumSize: Size(widget.widthButton, widget.heightButton),
          fixedSize: Size(widget.widthButton, widget.heightButton),
          elevation: widget.elevationButton,
          backgroundColor: widget.background,
          enableFeedback: true,
          side: BorderSide(color: input_stroke),
        ),
        onPressed: widget.onPressed,
        child: Row(
          children: [
            Spacer(),
            CustomIcon(
              pathIcon: widget.iconButton!,
              widthIcon: 32,
              heightIcon: 32,
              paddingIcon: 0,
            ),
            SizedBox(width: 16),
            Text(
              widget.textButton,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                color: black,
                fontWeight: widget.fontWeight,
                fontSize: widget.fontSize,
              ),
            ),
            Spacer(),
          ],
        ),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          ),
          minimumSize: Size(widget.widthButton, widget.heightButton),
          fixedSize: Size(widget.widthButton, widget.heightButton),
          side: widget.type == ButtonType.secondary
              ? BorderSide(color: accent, width: 1.5)
              : BorderSide.none,
          elevation: widget.elevationButton,
          backgroundColor: _getColor(),
          enableFeedback: true,
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.textButton,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.roboto(
            color: widget.type == ButtonType.secondary
                ? accent
                : widget.type == ButtonType.tetriary
                ? black
                : white,
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
          ),
        ),
      );
    }
  }
}
