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

        )
    );
  }
}
