import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttersetup/models/user_request_model.dart';
import 'package:fluttersetup/models/user_response_model.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/transaction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/interactions.dart';
import '../../../../resources/repositories.dart';
import '../../../../ultilites/ultility.dart';

class LoginBloc{

  final _repository = Repositories();
  UserResponseModel _model;

  login(BuildContext context, UserRequestModel model) async {
    showProgressDialog(context);
    ApiResponseData response = await _repository.login(context, model);
    hideProgressDialog();
    if(response.errorCode == 0){
      _model = UserResponseModel.fromJson(response.data);
      addUserToRF();
      //openAlertDialog(context, "Thông báo", response.data.toString());
      navigatorPushReplacement(context, TransactionScreen(), true);
    }
  }
  addUserToRF() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('iduser',_model.iD);
    prefs.setString('userfunct',_model.iDFunct);
    prefs.setString('token',_model.token);
  }
}