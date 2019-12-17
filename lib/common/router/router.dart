
import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/mainPage.dart';
import 'package:flutter_shiniu/main/producePage/productDetailPage/cowFormPage.dart';
import 'package:flutter_shiniu/main/producePage/productDetailPage/waitingParturition.dart';

class Router{

  Map<String,Widget Function(BuildContext)> getRouter (BuildContext context){
    return <String,Widget Function(BuildContext)> {
      '/Main' : (context)=>MainPage(),
      '/WaitingParturition' : (context)=> WaitingParturition(),
      '/CowFormPage' : (context)=>CowFormPage(),
    };
  }
}