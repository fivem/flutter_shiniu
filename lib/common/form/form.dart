import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/form/engine.dart';

class FormPage{
  BuildContext context;
  bool enable;
  FormPage({@required this.context,this.enable=true});
  final _formKey = GlobalKey<FormState>();
  Engine engine = Engine();

  buildFormPage(data){
    return Form(
      key:_formKey,
      child:ListView(
        children: <Widget>[
          Column(
            children: engine.parseWidget(data)
          ),

          SizedBox(height: 15.0),
          Visibility(
              visible: enable,
              child:Align(
                  child:SizedBox(
                    height: 45.0,
                    width: 270.0,
                    child: RaisedButton(
                        child: Text(
                          '保    存',
                          style: Theme.of(context).primaryTextTheme.headline,
                        ),
                        color: Colors.blue,
                        elevation:0,
                        highlightElevation:0,
                        disabledElevation:0,
                        shape: StadiumBorder(side: BorderSide(color:Colors.blue)),
                        onPressed: ()async{
                          if(_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            print(engine.map);
                          }
                          return null;
                        }
                    ),
                  )
              )
          )
        ],
      )
    );
  }
}