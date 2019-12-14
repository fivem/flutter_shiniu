
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/utils/datePicker.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
import 'package:flutter_shiniu/main/producePage/entity/cowEntity.dart';

class CowFormPage extends StatefulWidget {

  bool enable;
  CowFormPage({this.enable = true});
  @override
  _CowFormPageState createState() => _CowFormPageState();
}

class _CowFormPageState extends State<CowFormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _birthDayController = TextEditingController(text: formatDate(DateTime.now(), [yyyy, "-", mm, "-", dd]));
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
             //mark : InkWell is work but GestureDetector not work
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
                       onPressed: () {}),
                 ),
               ),
               onTap: (){
                 //just show , can not edit
                 if(widget.enable==true){
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
               }
             ),
             SizedBox(height: 60.0),
             Align(
               child:SizedBox(
                 height: 45.0,
                 width: 270.0,
                 child: RaisedButton(
                   child: Text(
                     '保    存',
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
