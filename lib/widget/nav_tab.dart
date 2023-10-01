import 'package:flutter/material.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
    required this.tabColor,
  });

  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;
  final Color tabColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isSelected ? 1 : 0.3,
        child: InkWell(
          onTap: () => onTap(),
          child: SizedBox(
            // color: Colors.black.withOpacity(0.1),
            height: 42.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 6.0,
                      bottom: 8.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: isSelected
                          ? tabColor.withOpacity(0.2)
                          : Colors.black.withOpacity(0.1),
                    ),
                    child: Icon(
                      isSelected ? selectedIcon : icon,
                      color: isSelected ? tabColor : Colors.black,
                      size: 20.0,
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
