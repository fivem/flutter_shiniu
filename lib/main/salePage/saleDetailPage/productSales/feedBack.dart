import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title:'反馈'),
      body: Container(

      )
    );
  }
}
