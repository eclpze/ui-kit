import 'package:flutter/material.dart';
import 'package:new_ui/src/color.dart';
import 'package:new_ui/src/typography.dart';

// Губайдуллина Камилла Рустемовна, создан 13.01.2026 12:31, навигация для использования в основном проекте
class CustomTabBar extends StatefulWidget {
  final Color color; // Фон текстового поля
  final List<String> titles; // Список разделов
  final List<String> icons; // Список иконок
  final VoidCallback onPressed; // Действие при нажатии

  const CustomTabBar({
    super.key,
    required this.color,
    required this.onPressed,
    required this.titles,
    required this.icons,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onPressed;
      },
      backgroundColor: widget.color,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: headlineRegular,
      unselectedLabelStyle: headlineRegular,
      selectedItemColor: accent,
      unselectedItemColor: color_icons,
      items: List.generate(
        widget.titles.length,
        (index) => BottomNavigationBarItem(
          icon: Image.asset(
            widget.icons[index],
            width: 24,
            color: _selectedIndex == index ? accent : color_icons,
          ),
          label: widget.titles[index],
        ),
      ),
    );
  }
}
