import 'package:flutter/material.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
  });

  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isSelected ? 1 : 0.3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? selectedIcon : icon,
                color: Colors.black,
                size: 28.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
