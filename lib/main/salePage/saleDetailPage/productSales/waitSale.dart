import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/net/net.dart';
import 'package:flutter_shiniu/common/utils/cyclePainter.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class WaitSale extends StatefulWidget {
  @override
  _WaitSaleState createState() => _WaitSaleState();
}

class _WaitSaleState extends State<WaitSale> {
  int total = 1;
  int current = 1;
  List listData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'待售'),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child:Column(
              children: <Widget>[
                Card(
                    elevation: 15.0,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child:Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0,20),
                      height:200,
                      child: CustomPaint(
                          foregroundPainter: CyclePainter(
                              totalCount: total,
                              currentCount: current,
                              lineColor: Colors.blueGrey,
                              completeColor:Colors.blue,
                              width: 25.0
                          ),
                          child: Container(
                              alignment: Alignment.center,
                              child: Text("待售 / 计划\n"+current.toString()+" / "+total.toString(),style: TextStyle(fontSize: 18),)
                          )
                      ),
                    )
                ),
                ListView.builder(
                    physics: new NeverScrollableScrollPhysics(),
                    shrinkWrap : true,
                    itemBuilder: (BuildContext context, int index){
                    return Card(
                        elevation: 15.0,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    height:90,
                                    width:140,
                                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      image: new DecorationImage(image: AssetImage(listData[index]['icon']), fit: BoxFit.cover),
                                      shape: BoxShape.rectangle,              // <-- 这里需要设置为 rectangle
                                      borderRadius: new BorderRadius.all(
                                        const Radius.circular(10.0),        // <-- rectangle 时，BorderRadius 才有效
                                      ),
                                    )
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                            child:Text(listData[index]["name"],style:TextStyle(fontSize: 15))
                                        ),
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                            child:Text(listData[index]["desc"],style:TextStyle(fontSize: 15))
                                        ),Container(
                                            alignment: Alignment.centerRight,
                                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                            child:Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child:Text(listData[index]["count"],style:TextStyle(fontSize: 15)),
                                                ),Container(
                                                    alignment: Alignment.bottomRight,
                                                    child:Text(listData[index]["date"],style:TextStyle(fontSize: 15))
                                                )
                                              ],
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                        )
                    );
                  },
                      itemCount:listData.length
                  ),
              ],
            ),
          ),
        )
    );
  }

  @override
  void initState() {
    _getWaitSaleData();
  }
  _getWaitSaleData() async{
    var result = await Net().get('/waitSale');
    setState((){
      total = result['total'];
      print(total);
      current = result['current'];
      print(current);
      listData = result['list'];
      print(listData);
    });
  }
}


