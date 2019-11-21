
import 'dart:math';

import 'package:flutter/material.dart';

class CyclePainter extends CustomPainter{
  int totalCount;
  int currentCount;
  Color lineColor;
  Color completeColor;
  double width;

  CyclePainter({this.totalCount,this.currentCount,this.lineColor,this.completeColor,this.width});

  @override
  void paint(Canvas canvas, Size size) {
    print(width);
    Paint line = Paint()
     ..color = this.lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = this.width;
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2, size.height/2);

    canvas.drawCircle(
        center,
        radius,
        line
    );

    double arcAngle = 2*pi*(currentCount/totalCount);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi/2,  //  从正上方开始
        arcAngle,
        false,
        complete
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}