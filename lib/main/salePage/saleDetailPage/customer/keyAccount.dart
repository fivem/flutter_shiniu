import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/net/net.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class KeyAccount extends StatefulWidget {
  @override
  _KeyAccountState createState() => _KeyAccountState();
}

class _KeyAccountState extends State<KeyAccount> {
  List listData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title:'关键客户'),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child:ListView.builder(itemBuilder: (BuildContext context,int index){
          return Container(
            child: Card(
              child: Stack(
                children: <Widget>[
                  Image.asset(listData[index]['img']),
                  Positioned(
                    child: Text(listData[index]['name']),
                  )
                ],
              ),
            ),
          );
        },itemCount: listData.length,)
      )
    );
  }

  @override
  void initState() {
    _getListData();
  }
  _getListData() async{
    var result = await Net().get("/keyAccount");
    setState(() {
      listData = result;
    });
  }

}
