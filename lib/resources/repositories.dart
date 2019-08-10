import 'package:flutter/material.dart';
import 'package:fluttersetup/common/interactions.dart';

import 'demo_resource.dart';

class Repositories{

  DemoResource _demoResource = DemoResource();

  Future<ApiResponseData> demo(BuildContext context) => _demoResource.demo(context);
}