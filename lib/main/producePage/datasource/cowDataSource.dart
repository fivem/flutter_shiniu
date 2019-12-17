import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/producePage/dao/waitingParturitionDao.dart';
import 'package:flutter_shiniu/main/producePage/entity/cowEntity.dart';
import 'package:flutter_shiniu/main/producePage/productDetailPage/cowFormPage.dart';

class CowDataSource extends DataTableSource{
  CowEntity cowEntity;
  List<CowEntity>  _listData = <CowEntity>[];
  BuildContext context;
  CowDataSource({this.cowEntity}){
    WaitingParturitionDao().query(cowEntity).then((result){
      _listData = result;
      notifyListeners();
    });
  }
  @override
  DataRow getRow(int index) {
    CowEntity cow = _listData[index];

    return DataRow.byIndex(
      cells: <DataCell>[
        DataCell(GestureDetector(child: Text('${cow.cowCode}',style: TextStyle(color: Colors.blue),),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_){
              return CowFormPage(enable: false,cow:cow);
            }));
          }
        )),
        DataCell(Text('${cow.EDC}')),
        DataCell(Text('${cow.state=="0"?"正常":"异常"}')),
        DataCell(Text('${cow.state=="0"?"否":"是"}')),

      ],
      selected: cow.selected,
      index: index,
      onSelectChanged: (isSelected) {
        cow.selected = !cow.selected;
        notifyListeners();
      }
    );
  }

  @override
  // 是否行数不确定
  bool get isRowCountApproximate => false;

  @override
  // 行数
  int get rowCount => _listData.length;

  @override
  // 选中行数
  int get selectedRowCount => 0;

  void sortData<T>(Comparable<T> getField(CowEntity cow),bool ascending){
    _listData.sort((CowEntity a,CowEntity b) {
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

}