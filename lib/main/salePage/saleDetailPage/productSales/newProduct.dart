import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/net/net.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class NewProduct extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  List listData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'新上'),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child:GridView.custom(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
            childrenDelegate: SliverChildBuilderDelegate((context, position) {
              return Container(
                child: Card(
                  elevation: 15.0,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  child: Column(
                    children: <Widget>[
                      /*ClipRect(
                        child: Image.asset(
                          listData[position]['icon'],
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),*/
                      Container(
                        width: 160.0,
                        height: 110.0,
                        margin: const EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          image: new DecorationImage(image: AssetImage(listData[position]['icon']), fit: BoxFit.cover),
                          shape: BoxShape.rectangle,              // <-- 这里需要设置为 rectangle
                          borderRadius: new BorderRadius.all(
                            const Radius.circular(10.0),        // <-- rectangle 时，BorderRadius 才有效
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                              child: Text(listData[position]['name'],style: TextStyle(fontSize: 15))
                            )
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Text(listData[position]['count'],style: TextStyle(fontSize: 10)),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(listData[position]['desc'],style: TextStyle(fontSize: 12)),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(listData[position]['date'],style: TextStyle(fontSize: 10)),
                      )
                    ],
                  ),
                )
              );
              },
              childCount:listData.length
            ),
          )
        )
    );
  }

  @override
  void initState() {
    _getListData();
  }
  _getListData() async{
    var result = await Net().get('/newProduct');
    setState(() {
      listData = result;
      print(listData);
    });
  }
}
