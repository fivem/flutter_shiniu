
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
  TextEditingController _fertilizationDateController = TextEditingController(text: formatDate(DateTime.now(), [yyyy, "-", mm, "-", dd]));
  TextEditingController _childbirthDateController = TextEditingController(text: formatDate(DateTime.now(), [yyyy, "-", mm, "-", dd]));
  TextEditingController _EDCDateController = TextEditingController(text: formatDate(DateTime.now(), [yyyy, "-", mm, "-", dd]));

  CowEntity cowEntity = new CowEntity();
  int _immuno = 0;
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
               enabled: widget.enable,
               decoration: InputDecoration(
                labelText: '编号',
               ),
               onSaved: (String value) => cowEntity.cowCode = value,
            ),
            TextFormField(
              enabled: widget.enable,
              decoration: InputDecoration(
                labelText: '状态'
              ),
              onSaved: (String value) => cowEntity.state = value,
            ),
            TextFormField(
              enabled: widget.enable,
              decoration: InputDecoration(
                labelText: '周期'
              ),
              onSaved: (String value) => cowEntity.period = value,
              onChanged: (String value){
                print(cowEntity.birthDay);
              },
            ),
            TextFormField(
             enabled: widget.enable,
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
                 labelText: '生产次数'
             ),
             onSaved: (String value) => cowEntity.period = value,
            ),
           //mark : InkWell is work but GestureDetector not work
            _buildDateElement(_birthDayController, '出生日期', cowEntity.birthDay,(String date)=>cowEntity.birthDay = date),

            _buildDateElement(_fertilizationDateController, '受精日期', cowEntity.fertilizationDate,(String date)=>cowEntity.fertilizationDate = date),

            _buildDateElement(_childbirthDateController, '分娩日期', cowEntity.childbirthDate,(String date)=>cowEntity.childbirthDate = date),

            _buildDateElement(_EDCDateController, '预产日期', cowEntity.EDC,(String date)=>cowEntity.EDC = date),
            Row(
             children: <Widget>[
               Text('是否已经免疫'),
               /*Radio(value: 1, groupValue: this._immuno, onChanged: (value)=>setState((){this._immuno = value;})),
               Text("是"),
               Radio(value: 0, groupValue: this._immuno, onChanged: (value)=>setState((){this._immuno = value;})),
               Text("否"),*/
               Expanded(
                 child:Align(
                 alignment: Alignment.centerRight,
                 child: Switch(
                   value: this._immuno==0?false:true,
                   onChanged: (value){
                     if(widget.enable!=false){
                       setState(() {
                         this._immuno = value?1:0;
                       });
                     }
                   },
                 ),
               )
               )

             ],
            ),

            SizedBox(height: 15.0),
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

  _buildDateElement(controller,label,date,callback){
    return InkWell(
        child:TextFormField(
          enabled: false,
          controller: controller,
          decoration:InputDecoration(
            labelText:  label,
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
              DatePicker().openDatePicker(context,date).then((result){
                //choose date
                if(result!=null){
                  date = formatDate(result, [yyyy, "-", mm, "-", dd]);
                  controller.text = date;
                  callback(date);
                }
              });
            });
          }
        }
    );
  }
}
