import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';

class HotSale extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HotSale();
  }
}

class _HotSale extends State<HotSale>{
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return WillPopScope(
      child:Scaffold(
        appBar: CommonAppBar(title: '热销'),
        body: Container(
          padding:EdgeInsets.all(8.0),
          child:Text('热销页面'),
        ),
      ),
      onWillPop:goBack
    ) ;
  }
  Future<bool> goBack(){
    print('hotSale go back');
    Navigator.of(context).pop();
    return new Future.value(false);
  }

}