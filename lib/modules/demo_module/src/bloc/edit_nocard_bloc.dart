

import 'package:flutter/material.dart';
import 'package:fluttersetup/common/interactions.dart';
import 'package:fluttersetup/models/transaction_request.dart';
import 'package:fluttersetup/resources/repositories.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditNoCardBloc{

  final _repository = Repositories();
  SharedPreferences _prefs;
  EditNoCardBloc(){
    SharedPreferences.getInstance().then((event) => _prefs = event);
  }

  putNoCardTransaction(BuildContext context,TransactionRequest model,Widget screen) async {
    if(_prefs == null)
      _prefs = await SharedPreferences.getInstance();
    TransactionRequest postRequest = TransactionRequest();
    postRequest = model;
    postRequest.iDUserUpdate = _prefs.getString("iduser");
    print(postRequest.toJson().toString());
    showProgressDialog(context);
    ApiResponseData response = await _repository.putNoCardTransaction(context, postRequest,_prefs.getString("iduser"));
    hideProgressDialog();
    if(response.errorCode == 0){
      navigatorPush(context,screen,true);
    }
  }
}