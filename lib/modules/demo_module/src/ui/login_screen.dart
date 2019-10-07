

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttersetup/models/user_request_model.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/login_bloc.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:fluttersetup/widgets/widget.dart';
import '../../../../common/constant.dart';
import '../../../../ultilites/ultility.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Platform.isIOS?FormKeyboardActions(
        child: _Content(),
      ):_Content(),
    );
  }
}


class _Content extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<_Content> {
  LoginBloc _bloc;

  TextEditingController _accountController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // focusText field
  final FocusNode _accountFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool _checked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = LoginBloc();

    if(Platform.isIOS)
      FormKeyboardActions.setKeyboardActions(context, configKeyboardActions([
            buildKeyboardAction(_accountFocus),
            buildKeyboardAction(_passwordFocus)
      ]));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget buildBanner() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: FlutterLogo(colors: Colors.green,),
            ),
            Container(
              height: 10.0,
            ),
            Text(
              "Wellcom back!",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Container(
              height: 10.0,
            ),
            Text("Login to continue using App",
                style: TextStyle(fontSize: sizeBody2, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget buildAccountBox() {
    return CustomTextField(
      controller: _accountController,
      focusNode: _accountFocus,
      textInputAction: TextInputAction.next,
      labelText: "Account",
      prefixIcon: Icons.person,
      onSubmitted: (event) => fieldFocusChange(context, _accountFocus, _passwordFocus),
    );
  }

  Widget buildPasswordBox() {
    return CustomTextField(
      controller: _passwordController,
      focusNode: _passwordFocus,
      labelText: "Password",
      prefixIcon: Icons.lock,
      obscureText: true,
      onSubmitted: (event) => _bloc.login(context, UserRequestModel(
          account: _accountController.text,
          pass: _passwordController.text
      )),
    );
  }

  Widget buildButtonLogin() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => _bloc.login(context, UserRequestModel(
            account: _accountController.text,
            pass: _passwordController.text
        )),
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: sizeBody2,
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
    );
  }
  Widget buildRemindAccount(){
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(value: _checked,onChanged: (bool check)=>{
            setState((){
              _checked = check;
              print(_checked.toString());
          })
          },checkColor: Colors.black,activeColor: Colors.green,),
          Text("Save Account and Password")
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            buildBanner(),
            buildAccountBox(),
            Container(height: 10.0,),
            buildPasswordBox(),
            Container(height: 10.0,),
            Container(height: 10.0,),
            buildButtonLogin(),
            Container(height: 10.0,),
            buildRemindAccount()
          ],
        ),
      ),
    );
  }
}
