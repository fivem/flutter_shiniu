import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class NewProduct extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'新上'),
        body: Container(

        )
    );
  }
}
