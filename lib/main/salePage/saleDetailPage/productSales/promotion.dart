import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/net/net.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class Promotion extends StatefulWidget {
  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  List listData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'促销'),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: ListView.builder(itemBuilder: (BuildContext context, int index){
            return Container(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 15.0,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                child: Stack(
                  children: <Widget>[
                    Image.asset(listData[index]['img']),
                    Positioned(
                      top: 5,
                      left: 70,
                      child: Container(
                          child: Text(listData[index]['content'],style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                      ),
                    )
                  ],
                )
              ),
            );
          },itemCount: listData.length,)
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _getListData();
  }
  _getListData() async{
    var result = await Net().get('/promotion');
    setState(() {
      listData = result;
    });
  }

}
