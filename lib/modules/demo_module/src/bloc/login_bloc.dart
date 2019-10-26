import 'package:flutter/material.dart';
import 'package:fluttersetup/models/user_request_model.dart';
import 'package:fluttersetup/models/user_response_model.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/handle/handle_page.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/manage/manage_page.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/seo/seo_page.dart';
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
      if(_model.iDFunct =="Qu")
        navigatorPushReplacement(context, ManagePage(), true);
      if(_model.iDFunct =="Xl")
        navigatorPushReplacement(context, HandlePage(), true);
      if(_model.iDFunct =="Se")
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