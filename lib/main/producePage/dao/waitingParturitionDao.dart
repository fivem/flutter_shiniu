
import 'package:flutter_shiniu/common/sqflite/sqfliteHandler.dart';
import 'package:flutter_shiniu/main/producePage/entity/cowEntity.dart';

class WaitingParturitionDao{
  String tableSQL = "create table pdt_cow( pkid test PRIMARY KEY , " +
      "cow_code text not null, state text, period text,"+
      "birth_Day date,birth_count int,fertilization_Date date,"+
      "childbirth_date date,EDC date,immuno int,remark text,create_date date,create_user text,delete_flag int)";

  SqfliteHandler handler;
  WaitingParturitionDao(){
    handler = new SqfliteHandler(tableName:'pdt_cow',tableSQL:this.tableSQL);
    //handler.reCreatTable();
  }

  insert(CowEntity cowEntity) async{
    String sql = "insert into pdt_cow values('${cowEntity.pkid}','${cowEntity.cowCode}',"
        "'${cowEntity.state}','${cowEntity.period}','${cowEntity.birthDay}',${cowEntity.birthCount.toString()},'"
        "${cowEntity.fertilizationDate}','${cowEntity.childbirthDate}','"
        "${cowEntity.EDC}',${cowEntity.immuno.toString()},'${cowEntity.remark}','${cowEntity.createDate}','"
        "${cowEntity.createUser}',${cowEntity.deleteFlag.toString()})";
    var id = await handler.insert(sql);
    return id;
  }
  delete(CowEntity cowEntity) async{
    String sql = "delete from pdt_cow where pkid = '${cowEntity.pkid}'";
    var id = await handler.update(sql);
  }

  Future<List<CowEntity>> query(CowEntity cow)async{
    String condition = "";
    if(cow!=null){
      condition = " where delete_flag = 0 ";
      if(cow.cowCode!='' && cow.cowCode!=null){
        condition += " and ";
        condition += " cow_code = '${cow.cowCode}'";
      }
    }
    var result = await handler.query("select * from pdt_cow" +condition);
    return assembleBean(result);
  }

  assembleBean(result){
    List<CowEntity> list = [];
    for(int i=0;i<result.length;i++){
      CowEntity cowEntity = new CowEntity();
      cowEntity.pkid = result[i]['pkid'];
      cowEntity.cowCode = result[i]['cow_code'];
      cowEntity.state = result[i]['state'];
      cowEntity.period = result[i]['period'];
      cowEntity.birthDay = result[i]['birth_Day'];
      cowEntity.birthCount = result[i]['birth_count'];
      cowEntity.fertilizationDate = result[i]['fertilization_Date'];
      cowEntity.childbirthDate = result[i]['childbirth_date'];
      cowEntity.EDC = result[i]['EDC'];
      cowEntity.immuno = result[i]['immuno'];
      cowEntity.createDate = result[i]['create_date'];
      cowEntity.createUser = result[i]['create_user'];
      cowEntity.deleteFlag = result[i]['delete_flag'];
      list.add(cowEntity);
    }
    return list;
  }

}