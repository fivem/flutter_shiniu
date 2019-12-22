
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/utils/buildRadioListTile.dart';
import 'package:flutter_shiniu/common/utils/datePicker.dart';
import 'package:flutter_shiniu/common/utils/debounce.dart';
import 'package:flutter_shiniu/common/utils/enumTransfer.dart';
import 'package:flutter_shiniu/common/utils/mask.dart';
import 'package:flutter_shiniu/common/utils/toast.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
import 'package:flutter_shiniu/main/producePage/dao/waitingParturitionDao.dart';
import 'package:flutter_shiniu/main/producePage/entity/cowEntity.dart';

class CowFormPage extends StatefulWidget {
  CowEntity cow;
  bool enable;
  CowFormPage({this.enable = true,this.cow});
  @override
  _CowFormPageState createState() => _CowFormPageState(this.cow);
}

class _CowFormPageState extends State<CowFormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _birthDayController;
  TextEditingController _fertilizationDateController;
  TextEditingController _childbirthDateController;
  TextEditingController _EDCDateController;
  TextEditingController _stateController;
  TextEditingController _periodController;

  CowEntity cowEntity = new CowEntity();
  String stateValue;
  String periodValue;

  _CowFormPageState(cow){
    if(cow!=null){
      cowEntity = cow;
      stateValue = cowEntity.state;
    }

    _birthDayController = TextEditingController(text: cowEntity.birthDay==null ?formatDate( DateTime.now(), [yyyy, "-", mm, "-", dd]):cowEntity.birthDay);
    _stateController = TextEditingController(text:EnumTransfer.getStateText(stateValue));
    _periodController = TextEditingController(text:EnumTransfer.getPeriodText(periodValue));
    _fertilizationDateController = TextEditingController();
    _childbirthDateController = TextEditingController();
    _EDCDateController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CommonAppBar(title:'详细内容'),

      body: Form(
        key : _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          children: <Widget>[
             TextFormField(
               enabled: widget.enable,
               initialValue: cowEntity.cowCode,
               decoration: InputDecoration(
                labelText: '编号',
               ),
               onSaved: (String value) => cowEntity.cowCode = value,
            ),
             _buildRadioListElement(context,_stateController,'状态',stateValue,EnumTransfer.stateMap,(value){
               setState(() {
                 _stateController.text = EnumTransfer.getStateText(value);
                 stateValue = value;
                 cowEntity.state = value;
               });
             }),
             _buildRadioListElement(context,_periodController,'周期',periodValue,EnumTransfer.periodMap,(value){
               setState(() {
                 _periodController.text = EnumTransfer.getPeriodText(value);
                 periodValue = value;
                 cowEntity.period = value;
               });
             }),
            TextFormField(
             enabled: widget.enable,
             initialValue: '${cowEntity.birthCount}',
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
                 labelText: '生产次数'
             ),
             onSaved: (String value) => cowEntity.birthCount = int.parse(value),
            ),
           //mark : InkWell is work but GestureDetector not work
            _buildDateElement(_birthDayController, '出生日期', cowEntity.birthDay,true,(String date)=>setState((){cowEntity.birthDay = date;})),
            _buildDateElement(_fertilizationDateController, '受精日期', cowEntity.fertilizationDate,false,(String date)=>setState((){cowEntity.fertilizationDate = date;})),
             TextFormField(
               enabled: widget.enable,
               initialValue: '${cowEntity.bullCode??""}',
               decoration: InputDecoration(
                   labelText: '种牛编号'
               ),
               onSaved: (String value) => cowEntity.bullCode = value,
             ),
            _buildDateElement(_childbirthDateController, '分娩日期', cowEntity.childbirthDate,false,(String date)=>setState((){cowEntity.childbirthDate = date;})),
            _buildDateElement(_EDCDateController, '预产日期', cowEntity.EDC,false,(String date)=>setState((){cowEntity.EDC = date;})),
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
                   value: cowEntity.immuno==1?true:false,
                   onChanged: (value){
                     if(widget.enable!=false){
                       setState(() {
                         cowEntity.immuno = value?1:0;
                       });
                     }
                   },
                 ),
               )
               )
             ],
            ),

            SizedBox(height: 15.0),
            Visibility(
              visible: widget.enable,
              child:Align(
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
                    onPressed: ()async{
                    if(_formKey.currentState.validate()){
                      _formKey.currentState.save();
                    }
                    Mask.show(context);
                    var id = await WaitingParturitionDao().save(cowEntity);
                    if(id>0){
                      Toast.show(context,'保存成功',(){
                        Mask.dismiss();
                        Navigator.of(context).popUntil(ModalRoute.withName("/WaitingParturition"));
                      });
                    }

                      return null;
                    }/*Debounce().debounce(()async{
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();
                      }
                      Mask.show(context);
                      var id = await WaitingParturitionDao().save(cowEntity);
                      if(id>0){
                        Toast.show(context,'保存成功',(){
                          Mask.dismiss();
                          Navigator.of(context).popUntil(ModalRoute.withName("/WaitingParturition"));
                        });
                      }
                    },200)*/
                ),
              )
            )
          )
          ],
        ),
      ),
    );
  }
  _buildRadioListElement(context,controller,label,initValue,map,callback){
    return InkWell(
      child: TextFormField(
        enabled: false,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down,color: Colors.blue,), onPressed: null)
        ),
      ),
      onTap: (){
        if(widget.enable == true){
          showDialog(
              context: context,
              child: new AlertDialog(
                //title: new Text("请选择"),
                content:SizedBox(
                    height: 230,
                    width: 200,
                    child: Column(
                      children: <Widget>[
                        BuildRadioListTile(callback:callback,initValue: initValue,map:map)
                      ],
                    )
                ),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text("确定")),
                ],
              )
          );
        }
      },
    );
  }
  _buildDateElement(controller,label,date,notNull,callback){
    if(date==null||date=='null'){
      date = formatDate(DateTime.now(),[yyyy, "-", mm, "-", dd]);
    }
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
                if(result==null && notNull==false){
                  date = null;
                }else if(result!=null){
                  date = formatDate(result,[yyyy, "-", mm, "-", dd]);
                }
                controller.text = date??'';
                callback(date);
              });
            });
          }
        }
    );
  }
}

