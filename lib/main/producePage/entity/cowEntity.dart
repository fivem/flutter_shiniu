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

  CowEntity({pkid,this.cowCode, this.state, this.period, this.birthDay,
      this.birthCount, this.fertilizationDate, this.childbirthDate, this.EDC,
      this.immuno, this.remark,createDate,createUser,deleteFlag});

}