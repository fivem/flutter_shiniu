
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/utils/toast.dart';
import 'package:flutter_shiniu/main/producePage/dao/waitingParturitionDao.dart';
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
  TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _dataTableSource.buildContext(context);
    _addInfo(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_){
        return CowFormPage(enable: true);
      },settings: RouteSettings(name: '/CowFormPage')));
    }
    _editInfo(){
      List<CowEntity> tempList = [];
      _dataTableSource.listData.forEach((cow){
        if(cow.selected == true){
          tempList.add(cow);
        }
      });
      if(tempList.length!=1){
        Toast.show(context,'请选中一条数据',null);
      }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (_){
          return CowFormPage(enable: true,cow:tempList[0]);
        },settings: RouteSettings(name: '/CowFormPage')));
      }

    }
    _deleteInfo(){
      assert(_dataTableSource.listData!=null);
      var tempList = [];
      _dataTableSource.listData.forEach((cow){
        if(cow.selected == true){
          tempList.add(cow);
        }
      });
      if(tempList.length==0){
        Toast.show(context, '请选择数据', null);
      }else{
        showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text("提示"),
              content: new Text("是否删除选中数据"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      _dataTableSource.listData.forEach((cow){
                        if(cow.selected == true){
                          WaitingParturitionDao().delete(cow);
                        }
                      });
                      setState((){
                        _dataTableSource = CowDataSource();
                      });
                      Navigator.of(context).pop();
                    },
                    child: new Text("确定")),
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text("取消")),
              ],
            ));
      }
    }
    _queryInfo(){
      setState((){
        _dataTableSource = CowDataSource(cowEntity: CowEntity(cowCode: _searchTextController.text));
      });
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
        padding: const EdgeInsets.all(4.0),
        children: <Widget>[
          PaginatedDataTable(
            header: SizedBox(height: 15,child:  TextFormField(
              style: TextStyle(fontSize: 12),
              controller: _searchTextController,
              decoration: InputDecoration(
                hintText: '请输入编号'
              ),
            ),),
            headingRowHeight:30,
            columnSpacing:18,
            dataRowHeight:38,
            actions: <Widget>[
              SizedBox(width: 25,child:IconButton(icon: Icon(Icons.search,color:Colors.blue,size: 20), onPressed: _queryInfo)),
              SizedBox(width: 25,child:IconButton(icon: Icon(Icons.edit,color:Colors.blue,size: 20), onPressed: _editInfo)),
              SizedBox(width: 25,child:IconButton(icon: Icon(Icons.remove,color:Colors.blue,size: 20), onPressed: _deleteInfo)),
              SizedBox(width: 25,child:IconButton(icon: Icon(Icons.add,color:Colors.blue,size: 20), onPressed: _addInfo)),
            ],
            columns:<DataColumn>[
              DataColumn(label: Text('编号'),onSort:
                  (int columnIndex,bool ascending)=>_sort((CowEntity cow)=>cow.cowCode,columnIndex,ascending)),
              DataColumn(label: Text('预产期')),
              DataColumn(label: Text('状态')),
              DataColumn(label: Text('免疫')),
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
  }
  @override
  void deactivate() {
    var bool = ModalRoute.of(context).isCurrent;
    if (bool) {
      _dataTableSource = CowDataSource();
    }
  }
}
