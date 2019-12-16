import 'package:date_format/date_format.dart';
import 'package:uuid/uuid.dart';

class CommonEntity{
   String pkid;
   String createDate;
   String createUser;
   int deleteFlag;
   CommonEntity({this.pkid,this.createDate,this.createUser,this.deleteFlag}){
      if(this.pkid == null){
        this.pkid = Uuid().v1();
      }
      if(this.createDate == null){
        this.createDate = formatDate(DateTime.now(),[yyyy, "-", mm, "-", dd]);
      }
      if(this.createUser == null){
        this.createUser = 'systemUser';
      }
      if(this.deleteFlag == null){
        this.deleteFlag = 0;
      }
   }
}