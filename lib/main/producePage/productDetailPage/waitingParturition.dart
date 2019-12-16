
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/sqflite/sqfliteHandler.dart';
import 'package:flutter_shiniu/main/producePage/dao/waitingParturitionDao.dart';
import 'package:flutter_shiniu/main/producePage/entity/cowEntity.dart';
import 'package:flutter_shiniu/main/producePage/productDetailPage/cowFormPage.dart';

import '../../commonAppBar.dart';

class WaitingParturition extends StatefulWidget {
  @override
  _WaitingParturitionState createState() => _WaitingParturitionState();
}

class _WaitingParturitionState extends State<WaitingParturition> {
  List listData = [];
  @override
  Widget build(BuildContext context) {
    _addInfo(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_){
        return CowFormPage(enable: false,cow:CowEntity(cowCode:'zt-1001',state: '正常',period: '待产期',birthCount: 3,birthDay: '2017-10-10',fertilizationDate: '2019-01-05',EDC: '2019-12-05',immuno: 1));
      }));
    }
    return Scaffold(
      appBar: CommonAppBar(title:'待产'),
      body: Container(

        child:ListView.builder(itemBuilder: (BuildContext context,int index){
          return Card(
            child:Row(
              children: <Widget>[
                Text('编号')
              ],
            )
          );
        },itemCount: listData.length),

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addInfo,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getListData();
  }
  _getListData()async{
    CowEntity cowEntity = new CowEntity(cowCode:'zt-001',state:'0',period:'1',birthDay:'2019-11-01',birthCount:3,
        fertilizationDate:'2019-11-02',childbirthDate:'2019-11-03',EDC:'2019-11-04',immuno:0,remark:'good girl');
    WaitingParturitionDao().insert(cowEntity).then((id){

       WaitingParturitionDao().query(cowEntity).then((result){
        print(result);

      });
    });


  }

}
