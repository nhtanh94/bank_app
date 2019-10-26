import 'package:flutter/material.dart';
import 'package:fluttersetup/common/interactions.dart';
import 'package:fluttersetup/models/get_list_transaction_request.dart';
import 'package:fluttersetup/models/transaction_request.dart';
import 'package:fluttersetup/models/user_request_model.dart';
import 'package:fluttersetup/resources/transaction_resource.dart';

import 'demo_resource.dart';
import 'user_resource.dart';

class Repositories{

  DemoResource _demoResource = DemoResource();
  UserResource _userResource = UserResource();
  TransactionResource _transactionResource = TransactionResource();
  Future<ApiResponseData> demo(BuildContext context) => _demoResource.demo(context);
  Future<ApiResponseData> login(BuildContext context, UserRequestModel model) => _userResource.login(context, model);
  Future<ApiResponseData> getListTransaction(BuildContext context,getListTransactionRequest model) => _transactionResource.getList(context,model);
  Future<ApiResponseData> getListProcessTransaction(BuildContext context,getListTransactionRequest model) => _transactionResource.getListProcess(context,model);
  Future<ApiResponseData> getListTransactionByStatus(BuildContext context,getListTransactionRequest model) => _transactionResource.getListByStatus(context,model);
  Future<ApiResponseData> postTransaction(BuildContext context,TransactionRequest model) => _transactionResource.postTransaction(context,model);
  Future<ApiResponseData> putNoCardTransaction(BuildContext context,TransactionRequest model,String idUser) => _transactionResource.putHandleTransaction(context,model,idUser);
}