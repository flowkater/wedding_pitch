import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  final String tag;
  final Text child;
  const HeroText({
    required this.tag,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
