import 'package:flutter/material.dart';

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // Start from top-left
    path.moveTo(0, 50); // Start 50 pixels down from top

    // Create curve at the top
    path.quadraticBezierTo(
      size.width / 2, // control point x (center)
      -50, // control point y (above the top)
      size.width, // end point x (right edge)
      50, // end point y (50 pixels down from top)
    );

    // Draw right edge
    path.lineTo(size.width, size.height);

    // Draw bottom edge
    path.lineTo(0, size.height);

    // Close the path (draws left edge back to start)
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}