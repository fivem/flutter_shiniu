import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/entity/commonEntity.dart';

class CowEntity extends CommonEntity{
  String cowCode;
  String state;
  String period;
  String birthDay;
  int birthCount;
  String fertilizationDate;
  String childbirthDate;
  String EDC;
  int immuno;
  String remark;

  CowEntity({pkid,this.cowCode, this.state='0', this.period, this.birthDay,
      this.birthCount=0, this.fertilizationDate, this.childbirthDate, this.EDC,
      this.immuno=0, this.remark,createDate,createUser,deleteFlag}){
    if(this.birthDay==null){
      this.birthDay = formatDate( DateTime.now(), [yyyy, "-", mm, "-", dd]);
    }
  }

}