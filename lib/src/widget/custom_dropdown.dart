import 'package:flutter/material.dart';
import 'package:new_ui/src/color.dart';
import 'package:new_ui/src/typography.dart';

// Губайдуллина Камилла Рустемовна, создан 18.12.2025 13:06, выпадающий список для использования в основном проекте
class CustomDropdown extends StatefulWidget {
  final List<String> _items; // Значения, которые можно выбрать
  final String hintText; // Заголовок списка
  final double borderRadius; // Границы списка
  final underline = SizedBox(); // Убирает линию у списка
  final bool isExpanded = true; // Растягивает по ширине
  final bool isDense = true; // Убирает внутренние отступы
  final double padding; // Отступы внутри
  final double margin; // Отступы снаружи
  final Color color; // Фон списка
  final Color borderColor; // Цвет границ

  CustomDropdown({
    super.key,
    required List<String> items,
    required this.hintText,
    required this.borderRadius,
    required this.padding,
    required this.color,
    required this.borderColor,
    required this.margin,
  }) : _items = items;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: widget.borderColor),
      ),
      child: DropdownButton(
        dropdownColor: input_bg,
        value: _selectedValue,
        items: widget._items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item, style: headlineMedium),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue!;
          });
        },
        hint: Text(
          widget.hintText,
          style: headlineMedium.copyWith(color: caption),
        ),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        underline: widget.underline,
        isExpanded: widget.isExpanded,
      ),
    );
  }
}
