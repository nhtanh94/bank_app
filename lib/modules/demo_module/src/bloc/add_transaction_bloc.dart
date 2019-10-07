
import 'package:flutter/material.dart';
import 'package:fluttersetup/common/interactions.dart';
import 'package:fluttersetup/models/transaction_request.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/transaction_screen.dart';
import 'package:fluttersetup/resources/repositories.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class AddTransactionBloc{
  final _repository = Repositories();
  SharedPreferences _prefs;

  AddTransactionBloc(){
    SharedPreferences.getInstance().then((event) => _prefs = event);
  }

  final _streamStatus = BehaviorSubject<String>();
  final _streamHaveCard = BehaviorSubject<String>();
  final _streamCard = BehaviorSubject<bool>();

  Observable<String> get outputStatus => _streamStatus.stream;
  Observable<String> get outputHaveCard => _streamStatus.stream;
  Observable<bool> get outputCard => _streamCard.stream;
  setStatus(String event) => _streamHaveCard.sink.add(event);
  setHaveCard(String event) => _streamStatus.sink.add(event);
  setCard(bool event) => _streamCard.sink.add(event);

  dispose(){
    _streamStatus.close();
    _streamCard.close();
    _streamHaveCard.close();
  }

  postTransaction(BuildContext context,TransactionRequest model) async {
    if(_prefs == null)
      _prefs = await SharedPreferences.getInstance();
    TransactionRequest postRequest = TransactionRequest();
    postRequest = model;
    postRequest.iDUserCreate = _prefs.getString("iduser");
    //showMsDialog(context, "Thông báo",postRequest.toJson().toString());
    showProgressDialog(context);
    ApiResponseData response = await _repository.postTransaction(context, postRequest);
    hideProgressDialog();
    if(response.errorCode == 0){
      navigatorPush(context,TransactionScreen(),true);
    }
  }
}