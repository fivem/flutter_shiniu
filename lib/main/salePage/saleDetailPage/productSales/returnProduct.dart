import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class ReturnProduct extends StatefulWidget {
  @override
  _ReturnProductState createState() => _ReturnProductState();
}

class _ReturnProductState extends State<ReturnProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'退货'),
        body: Container(

        )
    );
  }
}
