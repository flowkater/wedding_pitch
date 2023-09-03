import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final Widget body;

  const PageLayout({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 860,
          maxHeight: 1200,
        ),
        child: Center(
          child: Container(
            child: body,
          ),
        ),
      ),
    );
  }
}
