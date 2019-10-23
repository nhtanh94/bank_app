import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttersetup/models/user_request_model.dart';
import 'package:fluttersetup/models/user_response_model.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/seo_page.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/transaction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/interactions.dart';
import '../../../../resources/repositories.dart';
import '../../../../ultilites/ultility.dart';

class LoginBloc{

  final _repository = Repositories();
  UserResponseModel _model;

  login(BuildContext context, UserRequestModel model,bool remindAccount) async {
    showProgressDialog(context);
    ApiResponseData response = await _repository.login(context, model);
    hideProgressDialog();
    print(response.message);
    if(response.errorCode == 0){
      _model = UserResponseModel.fromJson(response.data);
      addUserToRF(remindAccount);
      //openAlertDialog(context, "Thông báo", response.data.toString());
      navigatorPushReplacement(context, SeoPage(), true);
    }
  }
  addUserToRF(bool remindAccount) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('iduser',_model.iD);
    prefs.setString('userfunct',_model.iDFunct);
    prefs.setString('token',_model.token);
    prefs.setString('fullname', _model.fullName);
    if(remindAccount){
      prefs.setString('username', _model.account);
      prefs.setString('password', _model.pass);
      prefs.setBool('checked', remindAccount);
    }
    else{
      prefs.setString('username', "");
      prefs.setString('password', "");
      prefs.setBool('checked', false);
    }

  }
}