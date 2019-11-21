import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class WaitSale extends StatefulWidget {
  @override
  _WaitSaleState createState() => _WaitSaleState();
}

class _WaitSaleState extends State<WaitSale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'待售'),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child:Column(
            children: <Widget>[
              Container(
                height:200,
                width: 200,
                child: CustomPaint(
                  foregroundPainter: CyclePainter(
                    totalCount: 300,
                    currentCount: 130,
                    lineColor: Colors.blue,
                    completeColor:Colors.red,
                    width: 8.0
                  ),
                  child:Text("CustomPaint child")
                ),
              )
            ],
          )
        )
    );
  }

}


class CyclePainter extends CustomPainter{
    double totalCount;
    double currentCount;
    Color lineColor;
    Color completeColor;
    double width;

    CyclePainter({totalCount,currentCount,lineColor,completeColor,width});

  @override
  void paint(Canvas canvas, Size size) {
    print(width);
    Paint line = Paint()
     // ..color = this.lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
/*
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
*/
    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2, size.height/2);

    canvas.drawCircle(
      center,
      radius,
      line
    );

    /*double arcAngle = 2*pi*(currentCount/totalCount);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi/2,  //  从正上方开始
        arcAngle,
        false,
        complete
    );*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
