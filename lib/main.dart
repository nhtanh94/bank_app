import 'package:flutter/material.dart';

import 'common/constant.dart';
import 'modules/demo_module/src/ui/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
        buttonColor: primaryColor
      ),
      home: LoginPage(),
    );
  }
}
