import 'package:flutter/material.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
  });

  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isSelected ? 1 : 0.3,
        child: InkWell(
          onTap: () => onTap(),
          child: SizedBox(
            height: 56.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.9),
                    ),
                    child: Icon(
                      isSelected ? selectedIcon : icon,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
