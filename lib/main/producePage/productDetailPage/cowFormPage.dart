
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/utils/datePicker.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
import 'package:flutter_shiniu/main/producePage/entity/cowEntity.dart';

class CowFormPage extends StatefulWidget {

  bool enable;
  CowFormPage({this.enable});
  @override
  _CowFormPageState createState() => _CowFormPageState();
}

class _CowFormPageState extends State<CowFormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _birthDayController = TextEditingController();
  CowEntity cowEntity = new CowEntity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title:'母牛'),
      body: Form(
        key : _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          children: <Widget>[
             TextFormField(
              decoration: InputDecoration(
                labelText: '编号',
              ),
              onSaved: (String value) => cowEntity.cowCode = value,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '状态'
              ),
              onSaved: (String value) => cowEntity.state = value,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '周期'
              ),
              onSaved: (String value) => cowEntity.period = value,
              onChanged: (String value){
                print(cowEntity.birthDay);
              },
            ),
             InkWell(
               child:TextFormField(
                 enabled: false,
                 controller: _birthDayController,
                 decoration:InputDecoration(
                   labelText:  "出生日期",
                   suffixIcon: IconButton(
                       icon: Icon(
                         Icons.date_range,
                         color: Colors.blue,
                       ),
                       onPressed: () {

                       }),

                 ),
                   validator:(String value){
                     String result = null;
                     var dateReg = RegExp("20[0-9]{2}-[0-9]{2}-[0-9]{2}");
                     if(!dateReg.hasMatch(value)){
                       result = "请输入正确日期(例如:2019-02-20)";
                     }else{
                       try{
                         var temp = DateTime.parse(value);
                         print(temp);
                       }catch(e){
                         result =  "非法日期";
                       }
                     }
                     return result;
                   }
               ),
               onTap: (){
                 setState(() {
                   DatePicker().openDatePicker(context,cowEntity.birthDay).then((result){
                     //choose date
                     if(result!=null){
                       cowEntity.birthDay = formatDate(result, [yyyy, "-", mm, "-", dd]);
                       _birthDayController.text = cowEntity.birthDay;
                     }
                   });
                 });
               }
             ),
             SizedBox(height: 60.0),
             Align(
               child:SizedBox(
                 height: 45.0,
                 width: 270.0,
                 child: RaisedButton(
                   child: Text(
                     '登    录',
                     style: Theme.of(context).primaryTextTheme.headline,
                   ),
                   color: Colors.blue,
                   elevation:0,
                   highlightElevation:0,
                   disabledElevation:0,
                     shape: StadiumBorder(side: BorderSide(color:Colors.blue)),
                     onPressed: (){
                     if(_formKey.currentState.validate()){
                       _formKey.currentState.save();
                     }

                 }

                 ),
               )
             )


          ],
        ),
      ),
    );
  }
}
