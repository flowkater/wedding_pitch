import 'package:flutter/material.dart';

class MovieShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // final double width = size.width;
    // final double height = size.height;

    // const double curveHeight = 15;

    var quarterHeight = size.height / 4;

    // Top semi-circle
    path.moveTo(0, quarterHeight);
    path.quadraticBezierTo(size.width / 2, 0, size.width, quarterHeight);

    // Bottom semi-circle
    path.lineTo(size.width, 3 * quarterHeight);
    path.quadraticBezierTo(size.width / 2, size.height, 0, 3 * quarterHeight);

    // 4 semi-circles on the left
    path.lineTo(0, 2.5 * quarterHeight);
    path.quadraticBezierTo(
        -quarterHeight / 2, 2 * quarterHeight, 0, 1.5 * quarterHeight);
    path.lineTo(0, quarterHeight);
    path.quadraticBezierTo(-quarterHeight / 2, 0.5 * quarterHeight, 0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
