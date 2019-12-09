
import 'package:flutter/material.dart';

class WaitingParturition extends StatefulWidget {
  @override
  _WaitingParturitionState createState() => _WaitingParturitionState();
}

class _WaitingParturitionState extends State<WaitingParturition> {
  @override
  Widget build(BuildContext context) {
    _addInfo(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_){
        return null;
      }));
    }
    return Scaffold(
      body: Container(
        child:Center(child:Text("待产")),

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addInfo,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

}
