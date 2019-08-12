

import 'package:flutter/material.dart';
import 'package:fluttersetup/common/interactions.dart';
import 'package:fluttersetup/models/get_list_transaction_request.dart';
import 'package:fluttersetup/models/transaction_reponse.dart';
import 'package:fluttersetup/models/transaction_response_model.dart';
import 'package:fluttersetup/resources/repositories.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class TransactionBloc{

  final _repository = Repositories();
  TransactionResponseModel _model;
  SharedPreferences _prefs;

  TransactionBloc(){
    SharedPreferences.getInstance().then((event) => _prefs = event);
  }

  final _streamModel = BehaviorSubject<TransactionResponseModel>();
  
  Observable<TransactionResponseModel> get outputModel => _streamModel.stream;
  
  setModel(TransactionResponseModel event) => _streamModel.sink.add(event);
  
  dispose(){
    _streamModel.close();
  }

  getListTransaction(BuildContext context) async {
    getListTransactionRequest model = getListTransactionRequest();
    if(_prefs == null)
      _prefs = await SharedPreferences.getInstance();
    model.iDuser = _prefs.getString("iduser");
    model.offset =0;
    model.limit=1000;
    showProgressDialog(context);
    ApiResponseData response = await _repository.getListTransaction(context, model);
    hideProgressDialog();
    if(response.errorCode == 0){
      _model = TransactionResponseModel.fromJson(response.data);

      setModel(_model);
    }
  }
}