import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class Guest extends StatefulWidget {
  @override
  _GuestState createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title:'来访客户'),
      body: Container(

      )
    );
  }
}
