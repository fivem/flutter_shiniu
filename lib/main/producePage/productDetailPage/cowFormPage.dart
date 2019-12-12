
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

  @override
  Widget build(BuildContext context) {
    CowEntity cowEntity = new CowEntity();
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
            ),
             GestureDetector(
              child: Text(
                  '出生日期'
                /*decoration: InputDecoration(
                    labelText: '出生日期'
                ),
                onSaved: (String value){

                },*/
              ),
              onTap: ()async{
                var result = await DatePicker().openDatePicker(context,cowEntity.birthDay);
                setState((){
                  cowEntity.birthDay = formatDate(result, [yyyy, "-", mm, "-", dd]);
                  print(cowEntity.birthDay);
                });
              },
            )

          ],
        ),
      ),
    );
  }
}
