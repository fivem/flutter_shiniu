import 'package:flutter/material.dart';

/**
 * {'permission':'r','data':[],'type':'input','initValue':'123','label':'label',key:'key'}
 */

class Input{
  var data;
  Function callback;
  Input({this.data,this.callback});
  Widget build(){
    print(data);

    var permission = data['permission'];
    if(permission=='r'){

    }

    TextEditingController controller = TextEditingController(text:data['initValue']);
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: data['label'],
      ),
      onSaved: (value){
        callback(value);
      },
    );
  }
}