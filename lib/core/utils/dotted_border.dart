import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;
  final double borderRadius;

  DottedBorderPainter({
    this.dashWidth = 12.0,
    this.dashSpace = 4.0,
    this.color = Colors.grey,
    this.borderRadius = 12.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Create a Path to simulate rounded corners
    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        ),
      );

    // Top side of the box
    _drawDashedLine(canvas, path, paint, size);

    // Bottom side of the box
    _drawDashedLine(canvas, path, paint, size, isBottom: true);

    // Left side of the box
    _drawDashedLine(canvas, path, paint, size, isLeft: true);

    // Right side of the box
    _drawDashedLine(canvas, path, paint, size, isRight: true);
  }

  // Function to draw dashed lines on the sides of the box
  void _drawDashedLine(
    Canvas canvas,
    Path path,
    Paint paint,
    Size size, {
    bool isBottom = false,
    bool isLeft = false,
    bool isRight = false,
  }) {
    double startX = 0;
    double startY = 0;

    // Depending on which side (left, right, top, or bottom), modify the starting point
    if (isBottom) {
      startX = 0;
      startY = size.height;
    } else if (isLeft) {
      startX = 0;
      startY = 0;
    } else if (isRight) {
      startX = size.width;
      startY = 0;
    }

    while ((isLeft || isRight) ? startY < size.height : startX < size.width) {
      if (isLeft || isRight) {
        canvas.drawLine(
          Offset(startX, startY),
          Offset(startX, startY + dashWidth),
          paint,
        );
        startY += dashWidth + dashSpace;
      } else {
        canvas.drawLine(
          Offset(startX, startY),
          Offset(startX + dashWidth, startY),
          paint,
        );
        startX += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
