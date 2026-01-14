import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

// Губайдуллина Камилла Рустемовна, создан 18.12.2025 10:10, кнопка-переключатель для использования в основном проекте
class CustomToggleButton extends StatefulWidget {
  final double widthToggle; // Ширина кнопки-переключателя
  final double heightToggle; // Высота кнопки-переключателя
  final double sizeToggle; // Размер переключателя
  final int colorToggle; // Цвет перелючателя
  final int colorActive; // Цвет активной кнопки-переключателя
  final int colorInactive; // Цвет отключенной кнопки-переключателя
  final bool initialValue;

  const CustomToggleButton({
    super.key,
    required this.widthToggle,
    required this.heightToggle,
    required this.sizeToggle,
    required this.colorToggle,
    required this.colorActive,
    required this.colorInactive,
    this.initialValue = false,
  });

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: widget.widthToggle,
      height: widget.heightToggle,
      activeColor: Color(widget.colorActive),
      inactiveColor: Color(widget.colorInactive),
      toggleColor: Color(widget.colorToggle),
      value: _value,
      onToggle: (bool value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}
