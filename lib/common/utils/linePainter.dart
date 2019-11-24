import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter{
  double width;
  Color color;
  Offset begin;
  Offset end;
  LinePainter({this.width,this.color,this.begin,this.end});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..color= this.color
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = this.width;
    canvas.drawLine(this.begin, this.end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}