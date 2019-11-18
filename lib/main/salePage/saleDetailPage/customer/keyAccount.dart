import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class KeyAccount extends StatefulWidget {
  @override
  _KeyAccountState createState() => _KeyAccountState();
}

class _KeyAccountState extends State<KeyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title:'关键客户'),
      body: Container(
        child:Text('大客户')
      )
    );
  }
}
