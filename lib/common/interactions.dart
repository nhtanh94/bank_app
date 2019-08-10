import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'dart:convert';
import 'dart:async';
import './constant.dart';
import './error_message.dart';

class ApiConnection {
  final int timeOut = 30;

  Map<String, String> headers(Map<String, String> content) {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: ''
    };

    if(content != null)
      headers.addAll(content);
    return headers;
  }

  Future<ApiResponseData> get(BuildContext context, String url,
      [Map<String, String> header, Map<String, String> query]) async {
    ApiResponseData data = await _checkConnectivity();
    if(data != null)
      return data;

    String fullUrl = serverUrl + url;

    if(query != null){
      String body = "?";
      query.forEach((key, value){
        body = body + key + "=" + value + "&";
      });
      body = body.substring(0, body.length - 1);
      fullUrl = fullUrl + body;
    }

    final response = await http
        .get(fullUrl, headers: headers(header))
        .timeout(new Duration(seconds: timeOut));

    return await _handleResponse(context, response);
  }

  Future<ApiResponseData> post(BuildContext context, String url, Map<String, dynamic> params,
      [Map<String, String> header]) async {
    ApiResponseData data = await _checkConnectivity();
    if(data != null)
      return data;

    final response = await http
        .post(serverUrl + url, headers: headers(header), body: params == null?"":json.encode(params))
        .timeout(new Duration(seconds: timeOut));

    return await _handleResponse(context, response);
  }

  Future<ApiResponseData> _checkConnectivity() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      var response = ApiResponseData(
          errorCode: -1,
          errorDescription: noConnectionError
      );
      return response;
    }

    return null;
  }

  Future<ApiResponseData> _handleResponse(BuildContext context, http.Response response) async {
    try{
      ApiResponseData responseData = ApiResponseData.fromJson(json.decode(response.body)["Result"]);
      if (responseData.errorCode == 0) {
        return responseData;
      } else {
        await openAlertDialog(context, "Thông báo", responseData.errorDescription);
        return responseData;
      }
    }
    catch (ex){
      openAlertDialog(context, "Thông báo", "Server gặp vấn đề. Vui lòng thử lại sau !!!");
      var response = ApiResponseData(
          errorCode: -1,
          errorDescription: noConnectionError
      );
      return response;
    }
  }
}

class ApiResponseData {
  int errorCode;
  String errorDescription;
  Map<String, dynamic> data;
  List<dynamic> datas;
  ApiResponseData({this.errorCode, this.errorDescription, this.data});
  ApiResponseData.fromJson(Map<String, dynamic> json) {
    errorCode = json["ErrorCode"];
    errorDescription = json["ErrorDescription"];
    if(json["Data"] != null){
      try{
        data = json["Data"];
      }
      catch(ex){
        try{
          datas = json["Data"];
        }
        catch(ex){}
      }
    }
  }
}