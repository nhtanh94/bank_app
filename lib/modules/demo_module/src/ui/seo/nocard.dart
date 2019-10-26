import 'package:flutter/material.dart';
import 'package:fluttersetup/common/constant.dart';
import 'package:fluttersetup/models/transaction_response_model.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/transaction_bloc.dart';
import 'package:fluttersetup/ultilites/hex_color.dart';
import 'package:fluttersetup/ultilites/ultility.dart';

import 'add_nocard.dart';
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
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _bloc.getListTransactionByStatus(context, 1));
  }

  Widget _buildProfile(
      String fullName,
      String statusName,
      String handleName,
      String address,
      String phone,
      String dateCreate,
      String dateUpdate,
      String note,
      Widget screen) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.white70),
      child: InkWell(
          onTap: () => navigatorPush(context, screen, true),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.label_important,color: Colors.green,),
              Container(width: 15.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        fullName,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      color: Colors.yellow,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: lineCardColor))),
                        child: RichText(
                          text: TextSpan(
                            text: "Trạng thái : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: statusName,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 15.0),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: lineCardColor))),
                        child: RichText(
                          text: TextSpan(
                            text: "Bước xử lý : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: handleName,
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 15.0),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: lineCardColor))),
                        child: RichText(
                          text: TextSpan(
                            text: "Ngày tạo : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: FormatDate(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(dateCreate),
                                        isUtc: true)),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: lineCardColor))),
                        child: RichText(
                          text: TextSpan(
                            text: "Update : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: (dateUpdate != ""
                                    ? FormatDate(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            int.parse(dateUpdate),
                                            isUtc: true))
                                    : ""),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: lineCardColor))),
                        child: RichText(
                          text: TextSpan(
                            text: "Địa chỉ : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: address,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: lineCardColor))),
                        child: RichText(
                          text: TextSpan(
                            text: "Phone : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: phone,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: lineCardColor))),
                        child: RichText(
                          text: TextSpan(
                            text: "Ghi chú : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: note,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        )),
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
  Refesh(){
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback(
              (_) => _bloc.getListTransactionByStatus(context,1));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(child: Icon(Icons.refresh),onPressed: ()=> Refesh(),)
        ],
      ),
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
                        model.customer.fullName,
                        _getSttName(model.status),
                        _getStatusHandelTransaction(model.statusHandle),
                        model.customer.address,
                        model.customer.phone,
                        model.dateCreate,
                        model.dateUpdate == null ? "" : model.dateUpdate,
                        model.note1,
                        EditNoCardPage(model));
                  }).toList(),
                );
        },
      ),
    );
  }
}
