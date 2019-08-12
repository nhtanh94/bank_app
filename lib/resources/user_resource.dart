import 'package:flutter/material.dart';
import 'package:fluttersetup/models/user_request_model.dart';
import '../common/constant.dart';
import '../common/interactions.dart';

class UserResource{

  Future<ApiResponseData> login(BuildContext context, UserRequestModel model) async {
    return ApiConnection().post(context, tokenURL, model.toJson());
  }
}