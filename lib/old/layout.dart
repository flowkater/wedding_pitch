import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final double horizontalPadding;

  const Layout({
    required this.body,
    required this.horizontalPadding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 600.0,
          child: Container(
            color: Colors.amber,
            child: Padding(
              padding: EdgeInsets.only(
                  left: horizontalPadding, right: horizontalPadding, top: 20),
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}
