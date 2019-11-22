import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/net/net.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class ReturnProduct extends StatefulWidget {
  @override
  _ReturnProductState createState() => _ReturnProductState();
}

class _ReturnProductState extends State<ReturnProduct> {
  List listData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'退货'),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: _handleRefresh,
            child: ListView.builder(itemBuilder: (BuildContext context,int index){
              return _buildListView(context,index);
            },
            itemCount: listData.length),
          )
        )
    );
  }

  _buildListView(BuildContext context,int index){
    return Card(
      elevation: 15.0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: Container(
        height:150,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(10, 10, 0,8),
                  child: Text(listData[index]['name'],style:TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                  )),
                ),
                Expanded(
                  child:Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0, 10, 10,8),
                    child: Text(listData[index]['desc']),
                  )
                ),
              ],
            ),
            Expanded(
              child:Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                child: Text('退货原因: '+listData[index]['reson'])
              )
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 8),
                        alignment: Alignment.centerLeft,
                        child:Text('联系人: '+listData[index]['user'])
                    )
                ),
                Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0,0, 10, 8),
                    child:Text('电话号: '+listData[index]['phone'])
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 8),
                    child:Text('订单号: '+listData[index]['code'])
                  )
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.fromLTRB(0,0, 10, 8),
                  child:Text(listData[index]['date'])
                )
              ],
            )
          ],
        ),
      )
    );
  }

  Future<Null> _handleRefresh() async{}

  @override
  void initState() {
    _getListData();
  }
  _getListData() async{
    var result = await Net().get('/returnProduct');
    setState(() {
      listData = result;
    });
  }
}
