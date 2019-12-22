import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/utils/enumTransfer.dart';

class BuildRadioListTile extends StatefulWidget {
  Function callback;
  String initValue;
  Map<String,String> map;
  BuildRadioListTile({this.callback,this.initValue,this.map});
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
      children: List<RadioListTile<String>>.generate(widget.map.length, (int index){
      return RadioListTile<String>(
          activeColor:Colors.blue,
          title:Text(widget.map['${index}']),
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