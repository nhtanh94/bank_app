import 'package:flutter/material.dart';
import './common/interactions.dart';
import './common/constant.dart';
import './ultilites/ultility.dart';
import 'modules/demo_module/src/ui/demo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoScreen(),
    );
  }
}
