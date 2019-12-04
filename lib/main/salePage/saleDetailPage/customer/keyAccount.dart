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
              elevation: 15.0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
              child:Row(
                children: <Widget>[
                  Container(
                      height:90,
                      width:120,
                      padding: EdgeInsets.all(10),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        image: new DecorationImage(image: AssetImage(listData[index]['img']), fit: BoxFit.fill),
                        shape: BoxShape.rectangle,              // <-- 这里需要设置为 rectangle
                        borderRadius: new BorderRadius.all(
                          const Radius.circular(10.0),        // <-- rectangle 时，BorderRadius 才有效
                        ),
                      )
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child:Text(listData[index]["name"],style:TextStyle(fontSize: 25))
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child:Text(listData[index]["account"],style:TextStyle(fontSize: 15))
                          )
                        ],
                      ),
                    ),
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
