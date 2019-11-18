import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class HaveSale extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HaveSale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'已售'),
        body: Container(

        )
    );
  }
}
