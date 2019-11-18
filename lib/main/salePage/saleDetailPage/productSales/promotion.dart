import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class Promotion extends StatefulWidget {
  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'促销'),
        body: Container(

        )
    );
  }
}
