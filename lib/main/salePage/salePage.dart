import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/salesCard.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/salesPlan.dart';

class SalePage extends StatefulWidget{
  @override
  _SalePage createState() => _SalePage();

}
class _SalePage extends State<SalePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title:'销售',icon:Icons.home),
      body: Column(
        children: <Widget>[
          SalesCard(),
          SalesPlan()
        ],
      )
    );
  }
  SelectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        )
    );
  }

}