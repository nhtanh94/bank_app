import 'package:flutter/material.dart';
import 'package:fluttersetup/common/constant.dart';
import 'package:fluttersetup/models/transaction_response_model.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/transaction_bloc.dart';
import 'package:fluttersetup/ultilites/ultility.dart';

import 'add_transaction_screen.dart';

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
  String GetStatus(int stt){
    switch(stt){
      case 0: return "Đã có thẻ";
      case 1: return "Đăng ký thẻ";
    }
    return "Error";
  }
  Widget _buildProfile(int status,String fullName,String statusTransaction,String dateCreate,String note,Widget screen){
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0)),color: Colors.black12),
      child: InkWell(
        onTap: ()=>navigatorPush(context,screen,true),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(status ==0?Icons.check:Icons.error_outline,color: Colors.orange),
            Container(width: 15.0),
          Expanded(
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(fullName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17.0),),
                Text("Trạng thái : " +statusTransaction,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 15.0),),
                Text("Ngày tạo : " + dateCreate,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15.0),),
                Text("Ghi chú  : " +note,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.0))
              ],
            ),
          )
          ],
        )),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Customer"),
        leading: Icon(Icons.search),
        actions: <Widget>[
          FlatButton(child: Icon(Icons.refresh),onPressed: ()=> _bloc.getListTransaction(context),)
        ],
      ),
    floatingActionButton: FloatingActionButton.extended(onPressed: ()=> navigatorPush(context,AddTransactionScreen(null),true),label: Text("Thêm mới"),icon:Icon(Icons.add),backgroundColor: primaryColor,),
      body: StreamBuilder(
        stream: _bloc.outputModel,
        initialData: null,
        builder: (context, snapshot){
          TransactionResponseModel model = snapshot.data;
          return model == null?Container():ListView(
            children: model.data.map((model){
              return _buildProfile(model.status,model.customer.fullName,GetStatus(model.status),model.dateCreate,model.note1,AddTransactionScreen(model));
            }).toList(),
          );
        },
      ),
    );
  }
}