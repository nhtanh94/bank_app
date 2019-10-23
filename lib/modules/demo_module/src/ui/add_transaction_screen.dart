import 'package:flutter/material.dart';
import 'package:fluttersetup/common/constant.dart';
import 'package:fluttersetup/models/customer_request.dart';
import 'package:fluttersetup/models/status_model.dart';
import 'package:fluttersetup/models/transaction_reponse.dart';
import 'package:fluttersetup/models/transaction_request.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/add_transaction_bloc.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/seo_page.dart';
import 'package:fluttersetup/widgets/widget.dart';
import 'package:fluttersetup/ultilites/ultility.dart';

class AddTransactionScreen extends StatefulWidget {

  final TransactionResponse model;

  AddTransactionScreen(this.model);

  @override
  _State createState() => _State();
}
class _State extends State<AddTransactionScreen> {

  TextEditingController _fullfameController = TextEditingController();
  TextEditingController _idcardController = TextEditingController();
  TextEditingController _expireController = TextEditingController();
  TextEditingController _passportController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _bankController = TextEditingController();
  TextEditingController _monthsController = TextEditingController();
  TextEditingController _refercodeController = TextEditingController();
  TextEditingController _chanelController = TextEditingController();
  TextEditingController _note1Controller = TextEditingController();


  // focusText field
  final FocusNode _fullnameFocus = FocusNode();
  final FocusNode _idcardFocus = FocusNode();
  final FocusNode _expireFocus = FocusNode();
  final FocusNode _passportFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _bankFocus = FocusNode();
  final FocusNode _monthsFocus = FocusNode();
  final FocusNode _refercodeFocus = FocusNode();
  final FocusNode _chanelFocus = FocusNode();
  final FocusNode _note1Focus = FocusNode();
  List<String> _listMessageCard = List<String>();
  List<StatusModel> _listStatus = List<StatusModel>();
  AddTransactionBloc _bloc;
  int _status = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = AddTransactionBloc();
    _listStatus..add(StatusModel(
      id: 0,
      name: "Đã nhận thẻ"
    ))..add(StatusModel(
        id: 1,
        name: "Đăng ký thẻ"
    ))..add(StatusModel(
        id: 2,
        name: "Chờ nhận thê"
    ));
    _listMessageCard.add("Đã Có thẻ");
    _listMessageCard.add("Chưa có thẻ");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }

  Widget buildFullName() {
    return CustomTextField(
      controller: _fullfameController,
      focusNode: _fullnameFocus,
      textInputAction: TextInputAction.next,
      labelText: "Họ tên",
      prefixIcon: Icons.person,
      onSubmitted: (event) => fieldFocusChange(context, _fullnameFocus, _idcardFocus),
    );
  }
  Widget buildIdCard() {
    return CustomTextField(
      controller: _idcardController,
      focusNode: _idcardFocus,
      textInputAction: TextInputAction.next,
      labelText: "Mã thẻ",
      prefixIcon: Icons.credit_card,
      onSubmitted: (event) => fieldFocusChange(context, _idcardFocus, _expireFocus),
    );
  }
  Widget buildExpire() {
    return CustomTextField(
      controller: _expireController,
      focusNode: _expireFocus,
      textInputAction: TextInputAction.next,
      labelText: "Ngày hết hạn thẻ",
      prefixIcon: Icons.date_range,
      onSubmitted: (event) => fieldFocusChange(context, _expireFocus, _passportFocus),
    );
  }
  Widget buildPassport() {
    return CustomTextField(
      controller: _passportController,
      focusNode: _passportFocus,
      textInputAction: TextInputAction.next,
      labelText: "CMND",
      prefixIcon: Icons.credit_card,
      onSubmitted: (event) => fieldFocusChange(context, _passportFocus, _addressFocus),
    );
  }
  Widget buildAddress() {
    return CustomTextField(
      controller: _addressController,
      focusNode: _addressFocus,
      textInputAction: TextInputAction.next,
      labelText: "Địa chỉ",
      prefixIcon: Icons.location_on,
      onSubmitted: (event) => fieldFocusChange(context, _addressFocus, _phoneFocus),
    );
  }
  Widget buildPhone() {
    return CustomTextField(
      controller: _phoneController,
      focusNode: _phoneFocus,
      textInputAction: TextInputAction.next,
      labelText: "Số điện thoại",
      prefixIcon: Icons.phone,
      onSubmitted: (event) => fieldFocusChange(context, _passportFocus, _bankFocus),
    );
  }
  Widget buildBank() {
    return CustomTextField(
      controller: _bankController,
      focusNode: _bankFocus,
      textInputAction: TextInputAction.next,
      labelText: "Ngân hàng",
      prefixIcon: Icons.local_atm,
      onSubmitted: (event) => fieldFocusChange(context, _bankFocus, _monthsFocus),
    );
  }
  Widget buildMonths() {
    return CustomTextField(
      controller: _monthsController,
      focusNode: _monthsFocus,
      textInputAction: TextInputAction.next,
      labelText: "Số tháng",
      prefixIcon: Icons.access_time,
      onSubmitted: (event) => fieldFocusChange(context, _monthsFocus, _refercodeFocus),
    );
  }
  Widget buildReferCode() {
    return CustomTextField(
      controller: _refercodeController,
      focusNode: _refercodeFocus,
      textInputAction: TextInputAction.next,
      labelText: "Mã giới thiệu",
      prefixIcon: Icons.code,
      onSubmitted: (event) => fieldFocusChange(context, _refercodeFocus, _chanelFocus),
    );
  }
  Widget buildChanel() {
    return CustomTextField(
      controller: _chanelController,
      focusNode: _chanelFocus,
      textInputAction: TextInputAction.next,
      labelText: "Kênh giải ngân",
      prefixIcon: Icons.local_atm,
      onSubmitted: (event) => fieldFocusChange(context, _chanelFocus, _note1Focus),
    );
  }
  Widget buildNote() {
    return CustomTextField(
      controller: _note1Controller,
      focusNode: _note1Focus,
      textInputAction: TextInputAction.next,
      labelText: "Ghi chú",
      prefixIcon: Icons.note,
      onSubmitted: (event) => fieldFocusChange(context, _note1Focus, null),
    );
  }
  Widget buildStatus(){
    return StreamBuilder(
      stream: _bloc.outputStatus,
      initialData: _listStatus[0].name,
      builder: (context, snapshot){
        return CustomText(
          prefixIcon: Icons.check_circle,
          text: snapshot.data,
          onTap: () => _showBottomDialog(),
        );
      },
    );
  }
  Widget buildStatusBottomDialog(StatusModel model){
    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              model.name,
              style: TextStyle(fontSize: sizeBody1),
            ),
          ),
          CustomLine()
        ],
      ),
      onTap: (){
        _bloc.setStatus(model.name);
        _status = model.id;
        navigatorPop(context);
      },
    );
  }
  _showBottomDialog(){
    showModalBottomSheet(context: context, builder: (context){
      return ListView(
        shrinkWrap: true,
        children: _listStatus.map((model){
          return buildStatusBottomDialog(model);
        }).toList(),
      );
    });
  }
  void postTransaction(){
    TransactionRequest model = new TransactionRequest();
    _bloc.postTransaction(context,model,AddTransactionScreen(null));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Customer"),
        leading: FlatButton(onPressed: ()=>navigatorPush(context,SeoPage(),true), child: Icon(Icons.arrow_back)),
        actions: <Widget>[
          FlatButton(child:
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Lưu"),
              Text("  "),
              Icon(Icons.save),

            ],
          ),
              onPressed: ()=> postTransaction(),
            color: Colors.limeAccent,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,

          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              buildStatus(),
              Container(height: 10.0,),
              buildFullName(),
              Container(height: 10.0,),
              buildIdCard(),
              Container(height: 10.0,),
              buildExpire(),
              Container(height: 10.0,),
              buildPassport(),
              Container(height: 10.0,),
              buildAddress(),
              Container(height: 10.0,),
              buildPhone(),
              Container(height: 10.0,),
              buildBank(),
              Container(height: 10.0,),
              buildMonths(),
              Container(height: 10.0,),
              buildReferCode(),
              Container(height: 10.0,),
              buildChanel(),
              Container(height: 10.0,),
              buildNote(),
            ],
          ),
        ),
      ),
    );
  }
}
