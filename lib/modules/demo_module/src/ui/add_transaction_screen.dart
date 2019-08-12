import 'package:flutter/material.dart';
import 'package:fluttersetup/models/transaction_reponse.dart';
import 'package:fluttersetup/models/transaction_response_model.dart';
import 'package:fluttersetup/widgets/widget.dart';
import '../../../../common/constant.dart';
import '../../../../ultilites/ultility.dart';

class AddTransactionScreen extends StatefulWidget {

  final TransactionResponse model;

  AddTransactionScreen(this.model);

  @override
  _State createState() => _State();
}

class _State extends State<AddTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
