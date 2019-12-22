
import 'package:flutter_shiniu/common/sqflite/sqfliteHandler.dart';
import 'package:flutter_shiniu/main/producePage/entity/cowEntity.dart';
import 'package:uuid/uuid.dart';

class WaitingParturitionDao{
  String tableSQL = "create table pdt_cow( pkid test PRIMARY KEY , " +
      "cow_code text not null, state text, period text,"+
      "birth_Day date,birth_count int,fertilization_Date date,bull_code text,"+
      "childbirth_date date,EDC date,immuno int,remark text,create_date date,create_user text,delete_flag int)";

  SqfliteHandler handler;
  WaitingParturitionDao(){
    handler = new SqfliteHandler(tableName:'pdt_cow',tableSQL:this.tableSQL);
    //handler.reCreatTable();
  }

  insert(CowEntity cowEntity) async{
    String sql = "insert into pdt_cow values('${cowEntity.pkid}','${cowEntity.cowCode}',"
        "'${cowEntity.state}','${cowEntity.period}','${cowEntity.birthDay}',${cowEntity.birthCount.toString()},'"
        "${cowEntity.fertilizationDate}','${cowEntity.bullCode}','${cowEntity.childbirthDate}','"
        "${cowEntity.EDC}',${cowEntity.immuno.toString()},'${cowEntity.remark}','${cowEntity.createDate}','"
        "${cowEntity.createUser}',${cowEntity.deleteFlag.toString()})";
    print(sql);
    var id = await handler.insert(sql);
    return id;
  }

  update(CowEntity cowEntity) async{
    String sql = "update pdt_cow set"
        " cow_Code = '${cowEntity.cowCode}',"
        " state = '${cowEntity.state}',"
        " period = '${cowEntity.period}',"
        " birth_Day = '${cowEntity.birthDay}',"
        " birth_Count = ${cowEntity.birthCount.toString()},"
        " fertilization_Date = '${cowEntity.fertilizationDate}',"
        " bullCode = '${cowEntity.bullCode}', "
        " childbirth_Date = '${cowEntity.childbirthDate}',"
        " EDC = '${cowEntity.EDC}',"
        " immuno = ${cowEntity.immuno.toString()},"
        " remark = '${cowEntity.remark}'"
        " where pkid = '${cowEntity.pkid}'";
    print(sql);
    var id = await handler.update(sql);
    return id;
  }

  save(CowEntity cowEntity) async{
    int id = 0;
    if(cowEntity.pkid==null||cowEntity.pkid.isEmpty){
      cowEntity.pkid = Uuid().v1();
      id = await insert(cowEntity);
    }else{
      id = await update(cowEntity);
    }
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
        condition += " cow_code like '%${cow.cowCode}%'";
      }
      if(cow.period!='' && cow.period!=null){
        condition += " and period ='${cow.period}' ";
      }
    }
    String sql = "select * from pdt_cow" +condition;
    var result = await handler.query(sql);
    print(sql);
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
      cowEntity.bullCode = result[i]['bull'];
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