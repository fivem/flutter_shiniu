import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/utils/buildRadioListTile.dart';
import 'package:flutter_shiniu/common/utils/enumTransfer.dart';

class RadioListElement extends StatefulWidget {
  var data;
  Function callback;
  RadioListElement({this.data,this.callback});

  @override
  _RadioListElementState createState() => _RadioListElementState();
}

class _RadioListElementState extends State<RadioListElement> {
  TextEditingController controller = TextEditingController();
  var state = '0';
  @override
  Widget build(BuildContext context) {
    if(controller.text==''||controller.text==null){
      state = widget.data['initValue'];
      controller.text = EnumTransfer.getValue(widget.data['initValue'],widget.data['enum']);
    }

    return Container(
      child:  InkWell(
        child: TextFormField(
          enabled: false,
          controller: controller,
          decoration: InputDecoration(
              labelText: "${widget.data['label']}",
              suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down,color: Colors.blue,), onPressed: null)
          ),
        ),
        onTap: (){
          if(widget.data['permission'] == 'w'){
            showDialog(
                context: context,
                child: new AlertDialog(
                  //title: new Text("请选择"),
                  content:SizedBox(
                      height: 230,
                      width: 200,
                      child: Column(
                        children: <Widget>[
                          BuildRadioListTile(callback:(value){
                            setState((){
                              state = value;
                              controller.text=EnumTransfer.getValue(value,widget.data['enum']);
                            });
                          widget.callback(value);},initValue: state,map:EnumTransfer.parseEnumType(widget.data['enum']))
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
      )
    );
  }
}

