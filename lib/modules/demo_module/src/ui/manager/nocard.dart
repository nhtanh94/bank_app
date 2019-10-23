import 'package:flutter/material.dart';
import 'package:fluttersetup/common/constant.dart';
import 'package:fluttersetup/models/transaction_response_model.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/transaction_bloc.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/manager/add_nocard.dart';
import 'package:fluttersetup/ultilites/hex_color.dart';
import 'package:fluttersetup/ultilites/ultility.dart';

import 'edit_nocard.dart';

class NoCardPage extends StatefulWidget {
  @override
  _NoCardPageState createState() => _NoCardPageState();
}

class _NoCardPageState extends State<NoCardPage> {
  TransactionBloc _bloc;
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = TransactionBloc();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _bloc.getListTransaction(context));
  }

  Widget _buildProfile(
      int status,
      String fullName,
      String statusTransaction,
      String statusDisbursedTransaction,
      String statusHandelTransaction,
      String dateCreate,
      String note,
      Widget screen) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.white),
      child: InkWell(
          onTap: () => navigatorPush(context, screen, true),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              status == 0
                  ? Icon(Icons.check, color: Colors.green)
                  : Icon(
                      Icons.av_timer,
                      color: Colors.red,
                    ),
              Container(width: 15.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.red))),
                        child: Text(
                          fullName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.red))),
                        child: Text(
                          "Trạng thái : " + statusTransaction,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.red))),
                        child: Text(
                          "Bước xử lý GN : " + statusDisbursedTransaction,
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.red))),
                        child: Text(
                          "Bước tạo thẻ : " + statusHandelTransaction,
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.red))),
                        child: Text(
                          "Ngày tạo : " + dateCreate,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.red))),
                        child: Text("Ghi chú  : " + note,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0)))
                  ],
                ),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }

  @override
  String _getSttName(int stt) {
    switch (stt) {
      case 0:
        return "Đã có thẻ";
      case 1:
        return "Đăng ký thẻ";
      case 2:
        return "Từ chối";
    }
    return "Error";
  }

  String _getStatusDisbursedTransaction(int stt) {
    switch (stt) {
      case 0:
        return "Chờ nhận thẻ";
      case 1:
        return "Chờ giải ngân";
      case 2:
        return "Đã giải ngân";
    }
    return "Error";
  }

  String _getStatusHandelTransaction(int stt) {
    switch (stt) {
      case 0:
        return "";
      case 1:
        return "Phone";
      case 2:
        return "FU";
      case 3:
        return "Bổ sung chứng từ";
      case 4:
        return "RJ";
      case 5:
        return "AppRove";
    }
    return "Error";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("007F55"),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => navigatorPush(context, AddNoCardPage(), true),
        label: Text("Thêm mới"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
      body: StreamBuilder(
        stream: _bloc.outputModel,
        initialData: null,
        builder: (context, snapshot) {
          TransactionResponseModel model = snapshot.data;
          return model == null
              ? Container()
              : ListView(
                  children: model.data.map((model) {
                    return _buildProfile(
                        model.status,
                        model.customer.fullName,
                        _getSttName(model.status),
                        _getStatusDisbursedTransaction(model.statusDisbursed),
                        _getStatusHandelTransaction(model.statusHandle),
                        model.dateCreate,
                        model.note1,
                        EditNoCardPage(model));
                  }).toList(),
                );
        },
      ),
    );
  }
}
