import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title:'调研'),
        body: Container(

        )
    );
  }
}
