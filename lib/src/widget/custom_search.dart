import 'package:flutter/material.dart';
import 'package:new_ui/src/color.dart';
import 'package:new_ui/src/typography.dart';
import 'package:new_ui/src/widget/custom_icon.dart';

// Губайдуллина Камилла Рустемовна, создан 18.12.2025 13:06, поиск для использования в основном проекте
class CustomSearch extends StatefulWidget {
  final Color colorSearch; // Цвет заливки
  final String hintText; // Текст поиска
  final Color colorCursor; // Цвет курсора
  final double radiusSearch; // Закругление
  final Color colorBorder; // Цвет границ
  final double padding; // Отступы
  final TextEditingController controller; // Контроллер

  const CustomSearch({
    super.key,
    required this.hintText,
    required this.colorCursor,
    required this.colorSearch,
    required this.radiusSearch,
    required this.colorBorder,
    required this.padding,
    required this.controller,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: TextField(
        controller: widget.controller,
        onChanged: (value) {
          setState(() {});
        },
        cursorColor: widget.colorCursor,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.colorSearch,
          hintText: widget.hintText,
          hintStyle: headlineRegular.copyWith(color: caption),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.radiusSearch),
            ),
            borderSide: BorderSide(color: widget.colorBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.radiusSearch),
            ),
            borderSide: BorderSide(color: widget.colorBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.radiusSearch),
            ),
            borderSide: BorderSide(color: widget.colorBorder),
          ),
          prefixIcon: CustomIcon(
            pathIcon: 'assets/search.svg',
            widthIcon: 20,
            heightIcon: 20,
            paddingIcon: 12,
          ),
          suffixIcon: widget.controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    widget.controller.clear();
                  },
                  child: CustomIcon(
                    pathIcon: 'assets/close.svg',
                    widthIcon: 20,
                    heightIcon: 20,
                    paddingIcon: 12,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
