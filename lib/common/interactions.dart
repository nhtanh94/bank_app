import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'dart:convert';
import 'dart:async';
import './constant.dart';
import './error_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConnection {
  final int timeOut = 10;
  SharedPreferences _prefs;

  ApiConnection(){
    SharedPreferences.getInstance().then((event) => _prefs = event);
  }

  Future<Map<String, String>> headers(Map<String, String> content) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: ''
    };

    if(_prefs == null)
      _prefs = await SharedPreferences.getInstance();
    
    headers.update(HttpHeaders.authorizationHeader, (_) => _prefs.getString("token")??"");

    if(content != null)
      headers.addAll(content);
    print(headers.toString());
    return headers;
  }

  Future<ApiResponseData> get(BuildContext context, String url,
      [Map<String, String> header, Map<String, dynamic> query]) async {
    ApiResponseData data = await _checkConnectivity();
    if(data != null)
      return data;

    String fullUrl = serverUrl + url;

    if(query != null){
      String body = "?";
      query.forEach((key, value){
        body = body + key + "=" + value.toString() + "&";
      });
      body = body.substring(0, body.length - 1);
      fullUrl = fullUrl + body;
    }

    final response = await http
        .get(fullUrl, headers: await headers(header))
        .timeout(new Duration(seconds: timeOut));
    return await _handleResponse(context, response);
  }

  Future<ApiResponseData> post(BuildContext context, String url, Map<String, dynamic> params,
      [Map<String, String> header]) async {
    ApiResponseData data = await _checkConnectivity();
    if(data != null)
      return data;

    final response = await http
        .post(serverUrl + url, headers: await headers(header), body: params == null?"":json.encode(params))
        .timeout(new Duration(seconds: timeOut));
    print(json.encode(params));
    return await _handleResponse(context, response);
  }

  Future<ApiResponseData> _checkConnectivity() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      var response = ApiResponseData(
          errorCode: -1,
          message: noConnectionError
      );
      return response;
    }

    return null;
  }

  Future<ApiResponseData> _handleResponse(BuildContext context, http.Response response) async {
    try{
      ApiResponseData responseData = ApiResponseData.fromJson(json.decode(response.body));
      if (responseData.errorCode == 0) {
        return responseData;
      } else {
        await openAlertDialog(context, "Thông báo", responseData.message);
        return responseData;
      }
    }
    catch (ex){
      openAlertDialog(context, "Thông báo", "Server gặp vấn đề. Vui lòng thử lại sau !!!");
      var response = ApiResponseData(
          errorCode: -1,
          message: noConnectionError
      );
      return response;
    }
  }

}

class ApiResponseData {
  int errorCode;
  String message;
  Map<String, dynamic> data;
  List<dynamic> datas;
  ApiResponseData({this.errorCode, this.message, this.data});
  ApiResponseData.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    message = json['message'];
    try{
      data = json['data'];
    }
    catch(ex){
      datas = json['data'];
    }
  }
}