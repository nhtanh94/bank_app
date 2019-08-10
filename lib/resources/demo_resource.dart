import 'package:flutter/material.dart';
import 'package:fluttersetup/common/interactions.dart';

class DemoResource{
  Future<ApiResponseData> demo(BuildContext context) async {
    return ApiResponseData(
      errorCode: 0,
      errorDescription: "",
      data: {
        "demos": [
          {"url": "https://highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png"},
          {"url": "https://highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png"},
          {"url": "https://highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png"},
          {"url": "https://highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png"},
          {"url": "https://highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png"},
          {"url": "https://highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png"},
          {"url": "https://highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png"},
          {"url": "https://highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png"},
          {"url": "https://highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png"},
          {"url": "https://highlandscoffee.com.vn/vnt_upload/product/05_2018/CFD.png"}
        ]
      }
    );
  }
}