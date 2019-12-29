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
    Map<String,Object> map1 =<String,Object>{'permission':'r','type':'input','initValue':'1233','label':'label','key':'key1'};
    Map<String,Object> map3 =<String,Object>{'permission':'r','type':'input','initValue':'1233','label':'label','key':'key2'};

    Map<String,Object> map4= <String,Object>{'permission':'r','type':'switch','initValue':true,'label':'label','key':'key3'};
    List<Map<String,Object>> list = [];
    list.add(map);
    list.add(map1);
    list.add(map3);
    list.add(map4);

    return Scaffold(
        body: Center(
            child: FormPage(context: context).buildFormPage(list)
        )
    );
  }

}