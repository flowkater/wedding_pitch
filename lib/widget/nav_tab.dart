import 'package:flutter/material.dart';

class NavTab extends StatefulWidget {
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
  State<NavTab> createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _sizeAnimation = Tween(begin: 20.0, end: 25.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.isSelected) {
      _controller.forward().then((value) {
        _controller.reverse();
      });
    }
  }

  double linearFunction(double x) {
    double m = -0.8;
    double b = 24;
    return m * x + b;
  }

  @override
  void didUpdateWidget(NavTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected && !oldWidget.isSelected) {
      _controller.forward().then((value) {
        _controller.reverse();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: widget.isSelected ? 1 : 0.3,
        child: InkWell(
          onTap: () => widget.onTap(),
          child: SizedBox(
            height: 42.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                            top: 2.0,
                            bottom: 6.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: widget.isSelected
                                ? widget.tabColor.withOpacity(0.2)
                                : Colors.black.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 1.0),
                            child: Icon(
                              widget.isSelected
                                  ? widget.selectedIcon
                                  : widget.icon,
                              color: widget.isSelected
                                  ? widget.tabColor
                                  : Colors.black,
                              size: _sizeAnimation.value,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
