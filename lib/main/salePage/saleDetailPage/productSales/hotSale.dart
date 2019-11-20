import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/net/net.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';


class HotSale extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HotSale();
  }
}

class _HotSale extends State<HotSale>{
  BuildContext context;
  List listData =[];

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return WillPopScope(
      child:Scaffold(
        appBar: CommonAppBar(title: '热销'),
        body: Container(
          padding:EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 15.0,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                child: Container(
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child:Container(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(listData[1]['name'],style:TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ),
                                Text('2nd',style:TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ))
                              ],
                            ),
                            height: 90,
                            width: 100,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: new BorderRadius.vertical(top: Radius.elliptical(14.0, 14.0),bottom: Radius.elliptical(14.0, 14.0)),//设置圆角
                                color: Colors.lightBlue
                            )
                        )
                      ),
                      Container(
                          child:Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(listData[0]['name'],style:TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ),
                              ),
                              Text('1st',style:TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))
                            ],
                          ),
                          height: 100,
                          width: 100,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.vertical(top: Radius.elliptical(14.0, 14.0),bottom: Radius.elliptical(14.0, 14.0)),//设置圆角
                              color: Colors.blue
                          )
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child:Container(
                          child:Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(listData[2]['name'],style:TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ),
                              ),
                              Text('3rd',style:TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))
                            ],
                          ),
                          alignment: Alignment.bottomCenter,
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.vertical(top: Radius.elliptical(14.0, 14.0),bottom: Radius.elliptical(14.0, 14.0)),//设置圆角
                              color: Colors.cyan
                          )
                        )
                      ),
                    ],
                  ),
                )
              ),
              Expanded(
                child: RefreshIndicator(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        elevation: 15.0,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                        child: Container(
                          height: 55,
                          child: Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child:CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 15.0,
                                  child: Text((index+4).toString())
                                )
                              ),
                              Expanded(
                                child:Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(listData[index+3]['name'])
                                )
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                child: Text(listData[index+3]['account'])
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                padding:EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: listData[index+3]['float']=='up'? Icon(Icons.trending_up,color: Colors.green):Icon(Icons.trending_down,color: Colors.red)
                              )
                            ],
                          )
                        )
                      );
                    },
                    itemCount: listData.length - 3
                  ),
                  onRefresh: _handleRefresh
                )
              )
            ],
          ),
        ),
      ),
      onWillPop:goBack
    ) ;
  }

  Future<Null> _handleRefresh() async{}

  Future<bool> goBack(){
    print('hotSale go back');
    Navigator.of(context).pop();
    return new Future.value(false);
  }

  @override
  void initState() {
    super.initState();
    listData.add({"name":""});
    listData.add({"name":""});
    listData.add({"name":""});
    _getListData();
  }
  _getListData() async{
    var result = await Net().get("/hostSaleListData");
    setState((){
      listData = result;
      print(listData);
    });
  }

}