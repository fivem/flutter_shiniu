import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/producePage/productDetailPage/waitingParturition.dart';

import '../commonAppBar.dart';

class ProducePage extends StatefulWidget{
  @override
  _ProducePage createState() => _ProducePage();

}

class _ProducePage extends State<ProducePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'生产',icon:Icons.home),
        body: SingleChildScrollView(
          child:Container(
              padding: EdgeInsets.all(8.0),
              child : Card(
                  elevation: 15.0,  //设置阴影
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),  //设置圆角
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child:SizedBox(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20.0,10.0,0,10),
                            child: Text('母牛管理'),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                getListIcon(context,Icons.record_voice_over,'待产期',WaitingParturition()),
                                getListIcon(context,Icons.record_voice_over,'怀孕期',WaitingParturition()),
                                getListIcon(context,Icons.record_voice_over,'休止期',WaitingParturition()),
                              ]
                          )
                      ),
                    ],
                  )
              )
          )
        ),
    );
  }
  getListIcon(BuildContext context,IconData icon,String text,Widget target){
    _handleTap(){
      Navigator.of(context).push(MaterialPageRoute(builder:(_){
        return target;
      }));
    }
    return GestureDetector(
      onTap:_handleTap,
      child:Column(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 20.0,
          child: Icon(icon,size:20)
        ),
        Text(text)
      ]
      )
    );
  }

}