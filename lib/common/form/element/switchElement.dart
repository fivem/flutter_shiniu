import 'package:flutter/material.dart';

class SwitchElement extends StatefulWidget {
  var data;
  Function callback;
  SwitchElement({this.data,this.callback});
  @override
  _State createState() => _State(data:this.data,callback:this.callback);
}

class _State extends State<SwitchElement> {
  var data;
  Function callback;
  bool sw = false;
  _State({this.data,this.callback}){
    sw = data['initValue'];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: Text("${data['label']}"),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Switch(
                value: sw,
                onChanged:(value){
                  setState((){
                    sw = value;
                  });
                  callback(value);
                }
            ),
          ),
        )
      ],
    );
  }
}
