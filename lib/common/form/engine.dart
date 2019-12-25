import 'package:flutter/material.dart';
import 'dart:convert';

class Engine{
  Map<String,Object> map=<String,Object>{};
  Engine();
  /**
   * {'permission':'r','data':[],'type':'input','initValue':'123','label':'label',key:'key'}
   */
  Widget inputEngine(data){
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
        this.map[data['key']] = value;
      },
    );
  }

  parseWidget(list){
    List<Widget> widgets = [];
    list.forEach((map){
        if(map['type']=='input'){
          widgets.add(inputEngine(map));
        }
    });
    return widgets;
  }
}