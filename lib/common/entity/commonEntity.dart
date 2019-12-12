import 'package:uuid/uuid.dart';

class CommonEntity{
   String pkid;
   DateTime createDate;
   String createUser;
   int deleteFlag;
   CommonEntity({this.pkid,this.createDate,this.createUser,this.deleteFlag}){
      if(this.pkid == null){
        this.pkid = Uuid().toString();
      }
      if(this.createDate == null){
        this.createDate = new DateTime.now();
      }
      if(this.createUser == null){
        this.createUser = 'systemUser';
      }
      if(this.deleteFlag == null){
        this.deleteFlag = 0;
      }
   }
}