
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/producePage/datasource/cowDataSource.dart';
import 'package:flutter_shiniu/main/producePage/entity/cowEntity.dart';
import 'package:flutter_shiniu/main/producePage/productDetailPage/cowFormPage.dart';

import '../../commonAppBar.dart';

class WaitingParturition extends StatefulWidget {
  @override
  _WaitingParturitionState createState() => _WaitingParturitionState();
}

class _WaitingParturitionState extends State<WaitingParturition> {
  List listData = <CowEntity>[];
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = false;
  CowDataSource _dataTableSource = CowDataSource();
  @override
  Widget build(BuildContext context) {
    _dataTableSource.buildContext(context);
    _addInfo(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_){
        return CowFormPage(enable: true,cow:CowEntity(cowCode:'zt-1001',state: '正常',period: '待产期',birthCount: 3,birthDay: '2017-10-10',fertilizationDate: '2019-01-05',EDC: '2019-12-05',immuno: 1));
      }));
    }
    void _sort<T>(Comparable<T> getField(CowEntity d), int columnIndex, bool ascending) {
      _dataTableSource.sortData<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }
    return Scaffold(
      appBar: CommonAppBar(title:'待产'),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          PaginatedDataTable(
            header: Text('母牛集合'),
              actions: <Widget>[/*跟header 在一条线的antion*/
                IconButton(icon: Icon(Icons.edit,color:Colors.blue), onPressed: null),
                IconButton(icon: Icon(Icons.remove,color:Colors.blue), onPressed: null),
                IconButton(icon: Icon(Icons.add,color:Colors.blue), onPressed: _addInfo),
              ],
              columns:<DataColumn>[
                DataColumn(label: Text('编号'),onSort:
                    (int columnIndex,bool ascending)=>_sort((CowEntity cow)=>cow.cowCode,columnIndex,ascending)),
                DataColumn(label: Text('预产期')),
                DataColumn(label: Text('状态')),
                DataColumn(label: Text('是否免疫')),
              ],
              source : _dataTableSource,
              onPageChanged : null,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              //onSelectAll: table.selectAll,
              rowsPerPage : _rowsPerPage,
              onRowsPerPageChanged : (int value) { setState(() { _rowsPerPage = value; }); },
          )
        ],
      ),
      /*floatingActionButton: new FloatingActionButton(
        onPressed: _addInfo,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),*/
    );
  }

  @override
  void initState() {
    super.initState();
    _getListData();
  }
  _getListData()async{
   /* CowEntity cowEntity = new CowEntity(cowCode:'zt-001',state:'0',period:'1',birthDay:'2019-11-01',birthCount:3,
        fertilizationDate:'2019-11-02',childbirthDate:'2019-11-03',EDC:'2019-11-04',immuno:0,remark:'good girl');
    WaitingParturitionDao().query(cowEntity).then((result){
      listData = result;
      print(listData);
    });*/
/*    WaitingParturitionDao().insert(cowEntity).then((id){

       WaitingParturitionDao().query(cowEntity).then((result){
        print(result);

      });
    });*/


  }

}
