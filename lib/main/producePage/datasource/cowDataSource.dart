import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/utils/enumTransfer.dart';
import 'package:flutter_shiniu/main/producePage/dao/waitingParturitionDao.dart';
import 'package:flutter_shiniu/main/producePage/entity/cowEntity.dart';
import 'package:flutter_shiniu/main/producePage/productDetailPage/cowFormPage.dart';

class CowDataSource extends DataTableSource{
  CowEntity cowEntity;
  List<CowEntity>  listData = <CowEntity>[];
  int selectedLength = 0;
  BuildContext context;
  String page;
  CowDataSource({@required this.page,this.cowEntity}){
    WaitingParturitionDao().query(cowEntity).then((result){
      listData = result;
      notifyListeners();
    });
  }
  @override
  DataRow getRow(int index) {
    CowEntity cow = listData[index];

    return DataRow.byIndex(
      cells: <DataCell>[
        DataCell(GestureDetector(
          child:Container(
            width: 40,
            child:Text('${cow.cowCode}',style: TextStyle(color: Colors.blue),),
          )
        ),onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_){
            return CowFormPage(enable: false,cow:cow);
          },settings:RouteSettings(name: '/CowFormPage')));
        }),
        DataCell(Container(width:70,child:Text(_buildDateTitle(this.page,cow)))),
        DataCell(Container(width:30,child:Text('${EnumTransfer.getStateText(cow.state)}'))),
        DataCell(Container(width:20,child:Center(child:Text('${cow.immuno=="0"?"否":"是"}')))),

      ],
      selected: listData[index].selected,
      index: index,
      onSelectChanged: (isSelected) {
        cow.selected = !cow.selected;
        if(cow.selected==true){
          this.selectedLength ++;
        }else{
          this.selectedLength --;
        }
        notifyListeners();
      }
    );
  }

  @override
  // 是否行数不确定
  bool get isRowCountApproximate => false;

  @override
  // 行数
  int get rowCount => listData.length;

  @override
  // 选中行数
  int get selectedRowCount => selectedLength;

  void sortData<T>(Comparable<T> getField(CowEntity cow),bool ascending){
    listData.sort((CowEntity a,CowEntity b) {
      if (!ascending) {
        final CowEntity c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  buildContext(context){
    this.context = context;
  }

  _buildDateTitle(page,CowEntity cow){

    switch(page){
      case 'waitingParturition': return cow.EDC=='null'?"":cow.EDC;
      case 'pregnancy': return cow.fertilizationDate=='null'?'':cow.fertilizationDate;
      case 'interruption': return cow.childbirthDate=='null'?'':cow.childbirthDate;
    }
  }

}