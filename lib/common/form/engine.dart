import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_shiniu/common/form/element/input.dart';

class Engine{
  Map<String,Object> map=<String,Object>{};
  Engine();


  parseWidget(list){
    List<Widget> widgets = [];
    list.forEach((data){
        if(data['type']=='input'){
          widgets.add(Input(data:data,callback:(value){this.map[data["key"]] = value;}).build());
        }
    });
    return widgets;
  }
}