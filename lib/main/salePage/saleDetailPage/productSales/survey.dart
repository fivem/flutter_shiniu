import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/net/net.dart';
import 'package:flutter_shiniu/common/utils/linePainter.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {

  List listData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'调研'),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                buildTitle(0),
                buildContent(0),
                buildTitle(1),
                buildContent(1),
                buildTitle(2),
                buildContent(2)
              ],
            )
          ),
        )
    );
  }

  buildContent(int index){
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child:Text(listData.length>index?listData[index]["content"]:"")
    );
  }

  buildTitle(int index){
   return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          children: <Widget>[
            Container(
                color: Color(0xE6E6FAFF),
                alignment: Alignment.center,
                height: 40,
                padding: EdgeInsets.fromLTRB(15.0,0.0, 10.0, 10.0),
                child:CustomPaint(
                  painter:LinePainter(color: Colors.blue,width: 3.0,begin: Offset(0.0,-4.0),end: Offset(0.0,18.0)),
                )
            ),
            Expanded(
                child:Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    color: Color(0xE6E6FAFF),
                    child: Text(listData.length>index?listData[index]["title"]:"",style: TextStyle(fontSize: 17),)
                )
            )
          ],
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _getListData();
  }
  _getListData() async{
    var result = await Net().get("/survey");
    print(result);
    setState(() {
      listData = result;
    });
  }
}
