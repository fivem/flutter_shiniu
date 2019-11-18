import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class Fresh extends StatefulWidget {
  @override
  _FreshState createState() => _FreshState();
}

class _FreshState extends State<Fresh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title:'新开客户'),
      body: Container(

      )
    );
  }
}
