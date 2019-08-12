import 'package:flutter/material.dart';
import 'package:fluttersetup/common/interactions.dart';
import 'package:fluttersetup/models/get_list_transaction_request.dart';
class TransactionResource{
  Future<ApiResponseData> getList(BuildContext context, getListTransactionRequest model) async {
    return ApiConnection().get(context, "GetTransaction",null, model.toJson());
  }
}