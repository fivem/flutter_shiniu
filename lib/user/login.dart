import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/mainPage.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget{

  @override
  _LoginPage createState() => _LoginPage();

}

class _LoginPage extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscure = true;
  Color _eyeColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 42.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 4.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      color: Colors.blue,
                      width: 40.0,
                      height: 2.0,
                    ),
                  ),
                ),
                SizedBox(height: 70.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '用户名',
                  ),
                  validator: (String value) {
                    var emailReg = RegExp(
                        r"[a-zA-Z]");
                    if (!emailReg.hasMatch(value)) {
                      return '请输入正确的用户名';
                    }
                  },
                  onSaved: (String value) => _email = value,
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  onSaved: (String value) => _password = value,
                  obscureText: _isObscure,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '请输入密码';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: '密码',
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: _eyeColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                              _eyeColor = _isObscure
                                  ? Colors.blue
                                  : Theme.of(context).iconTheme.color;
                            });
                          })),
                ),
                //buildForgetPasswordText(context),
                SizedBox(height: 60.0),
                Align(
                  child: SizedBox(
                    height: 45.0,
                    width: 270.0,
                    child: RaisedButton(
                      child: Text(
                        '登    录',
                        style: Theme.of(context).primaryTextTheme.headline,
                      ),
                      color: Colors.blue,
                      elevation:0,
                      highlightElevation:0,
                      disabledElevation:0,
                      onPressed: () async{
                        if (_formKey.currentState.validate()) {
                          ///只有输入的内容符合要求通过才会到达此处
                          _formKey.currentState.save();
                          //TODO 执行登录方法
                          print('email:$_email , assword:$_password');
                          Navigator.of(context).push(new MaterialPageRoute(builder:(_){
                            return new MainPage();
                          }));
                        }
                      },
                      shape: StadiumBorder(side: BorderSide(color:Colors.blue)),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                /*buildOtherLoginText(),
                  buildOtherMethod(context),
                  buildRegisterText(context),*/
              ],
            ))
    );
  }

}