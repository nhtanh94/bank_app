import 'package:flutter/material.dart';
import 'package:fluttersetup/common/constant.dart';
import 'package:fluttersetup/models/transaction_response_model.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/transaction_bloc.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/manage/edit_manage.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/seo/seo_page.dart';
import 'package:fluttersetup/ultilites/hex_color.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_screen.dart';

class ManagePage extends StatefulWidget {
  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  TransactionBloc _bloc;
  String fullName ='';
  getRefer() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs == null)
      prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString("fullname");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = TransactionBloc();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) => _bloc.getListTransaction(context));
    getRefer();

  }

  Widget _buildProfile(
      String fullName,
      String handleName,
      String address,
      String phone,
      String statusTransaction,
      String statusDisbursedTransaction,
      String dateCreate,
      String dateUpdate,
      String namenv,
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
                            color: Colors.redAccent,
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
                                text: statusTransaction,
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
                            text: "Bước GN : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: statusDisbursedTransaction,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15.0),
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
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: lineCardColor))),
                        child: RichText(
                          text: TextSpan(
                            text: "Nhân viên : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: namenv,
                                style: TextStyle(
                                    color: Colors.redAccent,
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
Refesh(){
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback(
              (_) => _bloc.getListTransaction(context));
    });
}
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  HexColor("007F55"),
                  Colors.green
                ]),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      child: FlutterLogo(colors: Colors.green,size: 80.0,),
                    ),
                    Text(fullName,style: TextStyle(fontSize: 25.0,color: Colors.white),)
                  ],
                ),
              ),

            ),
            CustomListTile(Icons.person,"Thông tin",(){}),
            CustomListTile(Icons.settings,"Cài đặt",(){}),
            CustomListTile(Icons.notifications,"Thông báo",(){}),
            CustomListTile(Icons.exit_to_app,"Đăng xuất",(){navigatorPushReplacement(context,LoginPage(),true);}),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("TRANG QUẢN LÝ"),
        actions: <Widget>[
          FlatButton(child: Icon(Icons.refresh),onPressed: ()=> Refesh(),)
        ],
      ),
      backgroundColor: HexColor("007F55"),
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
                  _getStatusHandelTransaction(model.statusHandle),
                  model.customer.address,
                  model.customer.phone,
                  _getSttName(model.status),
                  _getStatusDisbursedTransaction(model.statusDisbursed),
                  model.dateCreate,
                  model.dateUpdate == null ? "" : model.dateUpdate,
                  model.nameUser,
                  model.note1,
                  EditManagePage(model));
            }).toList(),
          );
        },
      ),
    );
  }
}
