import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class Extension extends StatefulWidget {
  @override
  _ExtensionState createState() => _ExtensionState();
}

class _ExtensionState extends State<Extension> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'推广'),
        body: Container(

        )
    );;
  }
}
