import 'package:flutter/material.dart';
import 'package:fluttersetup/models/transaction_response_model.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/transaction_bloc.dart';
import 'package:fluttersetup/ultilites/ultility.dart';

import 'add_transaction_screen.dart';
import 'login_screen.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}
class _State extends State<TransactionScreen> {
  TransactionBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = TransactionBloc();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bloc.getListTransaction(context));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: FloatingActionButton(onPressed: null,child: Icon(Icons.add),),
      body: StreamBuilder(
        stream: _bloc.outputModel,
        initialData: null,
        builder: (context, snapshot){
          TransactionResponseModel model = snapshot.data;
          return model == null?Container():ListView(
            children: model.data.map((model){
              return ListTile(
                title: Text(model.customer.fullName),
                subtitle: Text(model.dateCreate),
                onTap: () => navigatorPush(context, AddTransactionScreen(model), true),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
