import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/net/net.dart';
import 'package:flutter_shiniu/common/utils/linePainter.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class Extension extends StatefulWidget {
  @override
  _ExtensionState createState() => _ExtensionState();
}

class _ExtensionState extends State<Extension> {
  var South = true,East=false,West=true,Nouth=false,Middle=false;
  String extensionTitle='',extensionContent='',extensionAuthor='',extensionDate='';
  String executeTeam='',executeStartTime='',executeEndTime='',executeExpect='',executeAuditor='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'推广'),
        body: Container(
            child: Column(
              children: <Widget>[
                //推广方案
                Container(
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
                                child: Text('推广方案',style: TextStyle(fontSize: 17),)
                            )
                        )
                      ],
                    )
                ),
                //方案表单
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child:Column(
                    children: <Widget>[
                      //标题
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                            alignment: Alignment.center,
                            child: Text('标题')
                          ),
                          Expanded(
                            child:Text(extensionTitle),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                        child: CustomPaint(
                          painter: LinePainter(width: 1,color: Colors.grey,begin: Offset(0, 0),end: Offset(MediaQuery.of(context).size.width-30,0)),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                              alignment: Alignment.center,
                              child: Text('内容')
                          ),
                          Expanded(
                            child:Container(
                              padding:EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child:Text(extensionContent)
                            )
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                        child: CustomPaint(
                          painter: LinePainter(width: 1,color: Colors.grey,begin: Offset(0, 0),end: Offset(MediaQuery.of(context).size.width-30,0)),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                              alignment: Alignment.center,
                              child: Text('地区')
                          ),
                          Container(
                            child: Checkbox(
                              value: this.West,
                              activeColor: Colors.blue,
                              onChanged: (bool){
                                setState(() {
                                  //this.West=bool;
                                });
                              },
                            )
                          ),
                          Container(
                              child: Text('辽西')
                          ),
                          Container(
                              child: Checkbox(
                                value: this.East,
                                activeColor: Colors.blue,
                                onChanged: (bool){
                                  setState(() {
                                    //this.West=bool;
                                  });
                                },
                              )
                          ),
                          Container(
                              child: Text('辽东')
                          ),
                          Container(
                              child: Checkbox(
                                value: this.South,
                                activeColor: Colors.blue,
                                onChanged: (bool){
                                  setState(() {
                                    //this.West=bool;
                                  });
                                },
                              )
                          ),
                          Container(
                              child: Text('辽南')
                          ),
                          Container(
                              child: Checkbox(
                                value: this.Middle,
                                activeColor: Colors.blue,
                                onChanged: (bool){
                                  setState(() {
                                    //this.West=bool;
                                  });
                                },
                              )
                          ),
                          Container(
                              child: Text('辽中')
                          )

                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                        child: CustomPaint(
                          painter: LinePainter(width: 1,color: Colors.grey,begin: Offset(0, 0),end: Offset(MediaQuery.of(context).size.width-30,0)),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                              alignment: Alignment.center,
                              child: Text('制作人')
                          ),
                          Container(
                            child:Text(extensionAuthor),
                          ),
                          Expanded(
                            child:Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                              alignment: Alignment.centerRight,
                              child: Text('时间')
                            )
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 30, 10),
                            child:Text(extensionDate),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                        child: CustomPaint(
                          painter: LinePainter(width: 1,color: Colors.grey,begin: Offset(0, 0),end: Offset(MediaQuery.of(context).size.width-30,0)),
                        ),
                      ),
                    ],
                  )
                ),
              //执行方案
                Row(
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
                            child: Text('执行计划',style: TextStyle(fontSize: 17),)
                        )
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        alignment: Alignment.center,
                        child: Text('团队')
                    ),
                    Expanded(
                      child:Text(executeTeam),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                  child: CustomPaint(
                    painter: LinePainter(width: 1,color: Colors.grey,begin: Offset(0, 0),end: Offset(MediaQuery.of(context).size.width-30,0)),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        alignment: Alignment.center,
                        child: Text('开始时间')
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        alignment: Alignment.center,
                        child: Text(executeStartTime)
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        alignment: Alignment.center,
                        child: Text('结束时间')
                    ),
                    Expanded(
                      child:Text(executeEndTime),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                  child: CustomPaint(
                    painter: LinePainter(width: 1,color: Colors.grey,begin: Offset(0, 0),end: Offset(MediaQuery.of(context).size.width-30,0)),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        alignment: Alignment.center,
                        child: Text('预期目标')
                    ),
                    Expanded(
                      child:Text(executeExpect),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                  child: CustomPaint(
                    painter: LinePainter(width: 1,color: Colors.grey,begin: Offset(0, 0),end: Offset(MediaQuery.of(context).size.width-30,0)),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        alignment: Alignment.center,
                        child: Text('审核人')
                    ),
                    Expanded(
                      child:Text(executeAuditor),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                  child: CustomPaint(
                    painter: LinePainter(width: 1,color: Colors.grey,begin: Offset(0, 0),end: Offset(MediaQuery.of(context).size.width-30,0)),
                  ),
                ),
              ],
            )
        )
    );;
  }

  @override
  void initState() {
    _getData();
  }
  _getData() async{
    var result = await Net().get('/extension');

    print(result);
    setState((){
      extensionTitle = result['extension']['title'];
      print(extensionTitle);
      extensionContent = result['extension']['content'];
      extensionAuthor = result['extension']['author'];
      extensionDate = result['extension']['date'];
      executeTeam = result['execution']['team'];
      executeStartTime = result['execution']['startTime'];
      executeEndTime = result['execution']['endTime'];
      executeExpect = result['execution']['expect'];
      executeAuditor = result['execution']['auditor'];
    });
  }
}
