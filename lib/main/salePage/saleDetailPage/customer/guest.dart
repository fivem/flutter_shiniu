import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/net/net.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class Guest extends StatefulWidget {
  @override
  _GuestState createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  List listData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title:'来访客户'),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: RefreshIndicator(child: ListView.builder(itemBuilder: (BuildContext context,int index){
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
                        image: new DecorationImage(image: AssetImage(listData[index]['img']), fit: BoxFit.cover),
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
                              child:Text(listData[index]["inTime"],style:TextStyle(fontSize: 15))
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },itemCount: listData.length,), onRefresh: _handleRefresh),
      )
    );
  }

  Future<Null> _handleRefresh() async{}

  @override
  void initState() {
    _getListData();
  }
  _getListData() async{
    var result = await Net().get("/guest");
    setState(() {
      listData = result;
    });
  }
}
