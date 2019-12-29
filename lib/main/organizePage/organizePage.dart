import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/form/engine.dart';
import 'package:flutter_shiniu/common/form/form.dart';

class OrganizePage extends StatefulWidget{
  @override
  _OrganizePage createState() => _OrganizePage();

}

class _OrganizePage extends State<OrganizePage>{
  var sw = false;

  @override
  Widget build(BuildContext context) {
    Map<String,Object> map =<String,Object>{'permission':'r','type':'input','initValue':'123','label':'label','key':'key'};
    Map<String,Object> map1 =<String,Object>{'permission':'r','type':'input','initValue':'1233','input1':'label','key':'key1'};
    Map<String,Object> map3 =<String,Object>{'permission':'r','type':'input','initValue':'1233','input3':'label','key':'key3'};

    Map<String,Object> map4= <String,Object>{'permission':'r','type':'switch','initValue':true,'label':'switch','key':'key4'};
    Map<String,Object> map5=<String,Object>{'permission':'w','type':'radioList','initValue':'1','label':'radioList','key':'key5','enum':'stateMap'};
    Map<String,Object> map6=<String,Object>{'permission':'w','type':'date','initDate':'2019-01-01','initTime':'05:02:01','label':'date','key':'key6','required':false,'format':'yyyy-mm-dd HH:MM:SS'};
    List<Map<String,Object>> list = [];
    list.add(map);
    list.add(map1);
    list.add(map3);
    list.add(map4);
    list.add(map5);
    list.add(map6);

    return Scaffold(
        body: Center(
            child: FormPage(context: context).buildFormPage(list)
        )
    );
  }

}