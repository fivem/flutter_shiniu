
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/utils/datePicker.dart';
import 'package:flutter_shiniu/common/utils/enumTransfer.dart';
import 'package:flutter_shiniu/common/utils/toast.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
import 'package:flutter_shiniu/main/producePage/dao/waitingParturitionDao.dart';
import 'package:flutter_shiniu/main/producePage/entity/cowEntity.dart';
import 'package:flutter_shiniu/main/producePage/productDetailPage/waitingParturition.dart';

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
  CowEntity cowEntity = new CowEntity();
  String stateValue;

  _CowFormPageState(cow){
    if(cow!=null){
      cowEntity = cow;
      stateValue = cowEntity.state;
    }

    _birthDayController = TextEditingController(text: cowEntity.birthDay==null ?formatDate( DateTime.now(), [yyyy, "-", mm, "-", dd]):cowEntity.birthDay);
    _stateController = TextEditingController(text:EnumTransfer.getStateText(stateValue));
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
             _buildRadioListElement(context,_stateController,'状态',stateValue,(value){
               setState(() {
                 _stateController.text = EnumTransfer.getStateText(value);
                 stateValue = value;
                 cowEntity.state = value;
               });
             }),
            TextFormField(
              enabled: widget.enable,
              initialValue: cowEntity.period,
              decoration: InputDecoration(
                labelText: '周期'
              ),
              onSaved: (String value) => cowEntity.period = value,
              onChanged: (String value){
              },
            ),
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
            _buildDateElement(_birthDayController, '出生日期', cowEntity.birthDay,true,(String date)=>cowEntity.birthDay = date),
            _buildDateElement(_fertilizationDateController, '受精日期', cowEntity.fertilizationDate,false,(String date)=>cowEntity.fertilizationDate = date),
            _buildDateElement(_childbirthDateController, '分娩日期', cowEntity.childbirthDate,false,(String date)=>cowEntity.childbirthDate = date),
            _buildDateElement(_EDCDateController, '预产日期', cowEntity.EDC,false,(String date)=>cowEntity.EDC = date),
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
                      var id = await WaitingParturitionDao().insert(cowEntity);
                      if(id>0){
                        /*showDialog(
                            context: context,
                            child: new AlertDialog(
                              title: new Text("提示"),
                              content: new Text("保存成功"),
                              actions: <Widget>[
                                new FlatButton(
                                    onPressed: () {
                                       Navigator.of(context).popUntil(ModalRoute.withName("/WaitingParturition"));
                                    },
                                    child: new Text("确定")),
                              ],
                            ));*/
                        Toast.show(context,'保存成功',(){
                          Navigator.of(context).popUntil(ModalRoute.withName("/WaitingParturition"));
                        });
                      }
                   }
                ),
              )
            )
          )
          ],
        ),
      ),
    );
  }
  _buildRadioListElement(context,controller,label,initValue,callback){
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
                        BuildRadioListTile(callback:callback,initValue: initValue)
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
                  date = '';
                }else{
                  date = formatDate(result, [yyyy, "-", mm, "-", dd]);
                }
                controller.text = date;
                callback(date);
              });
            });
          }
        }
    );
  }
}


class BuildRadioListTile extends StatefulWidget {
  Function callback;
  String initValue;
  BuildRadioListTile({this.callback,this.initValue});
  @override
  _BuildRadioListTileState createState() => _BuildRadioListTileState();
}

class _BuildRadioListTileState extends State<BuildRadioListTile> {
  String stateValue ;
  @override
  Widget build(BuildContext context) {
    if(stateValue == null){
      stateValue = widget.initValue == ""||widget.initValue==null ? "0" : widget.initValue;
    }
    return  Column(
      children: List<RadioListTile<String>>.generate(4, (int index){
      return RadioListTile<String>(
          activeColor:Colors.blue,
          title:Text(EnumTransfer.getStateText('${index}')),
          //subtitle:Text('subTitle'),
          selected:stateValue == '${index}',
          value: '${index}',
          groupValue: stateValue,
          onChanged: (value)=> setState((){
            stateValue = value;
            widget.callback(value);
          })
        );
      },
    )
    );
  }
}
