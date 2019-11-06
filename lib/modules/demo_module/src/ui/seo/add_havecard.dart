
import 'package:flutter/material.dart';
import 'package:fluttersetup/common/constant.dart';
import 'package:fluttersetup/models/status_model.dart';
import 'package:fluttersetup/models/transaction_request.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/add_transaction_bloc.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:fluttersetup/widgets/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'seo_page.dart';

class AddHaveCardPage extends StatefulWidget {
  @override
  _AddHaveCardPageState createState() => _AddHaveCardPageState();
}

class _AddHaveCardPageState extends State<AddHaveCardPage> {
  SharedPreferences prefs;
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _passportController = TextEditingController();
  TextEditingController _datePassportCreateController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _bankController = TextEditingController();
  TextEditingController _idCardController = TextEditingController();
  TextEditingController _cardLimitController = TextEditingController();
  TextEditingController _cardExpiresController = TextEditingController();
  TextEditingController _statementDateController = TextEditingController();
  TextEditingController _loanController = TextEditingController();
  TextEditingController _timeLoanController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  // focusText field
  final FocusNode _fullNameFocus = FocusNode();
  final FocusNode _dateOfBirthFocus = FocusNode();
  final FocusNode _passportFocus = FocusNode();
  final FocusNode _datePassportFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _bankFocus = FocusNode();
  final FocusNode _idCardFocus = FocusNode();
  final FocusNode _cardLimitFocus = FocusNode();
  final FocusNode _cardExpiresFocus = FocusNode();
  final FocusNode _statementDateFocus = FocusNode();
  final FocusNode _loanFocus = FocusNode();
  final FocusNode _timeLoanFocus = FocusNode();
  final FocusNode _noteFocus = FocusNode();
  List<String> _listMessageCard = List<String>();
  List<StatusModel> _listChanel = List<StatusModel>();
  AddTransactionBloc _bloc;
  String _chanelName ='';
  getRefer() async{
     prefs = await SharedPreferences.getInstance();
    if(prefs == null)
      prefs = await SharedPreferences.getInstance();

    }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = AddTransactionBloc();
    _listChanel..add(StatusModel(
        id: 0,
        name: "TGDĐ"
    ))..add(StatusModel(
        id: 1,
        name: "Tiền mặt"
    ))..add(StatusModel(
        id: 2,
        name: "Chuyển khoản"
    ));
    _listMessageCard.add("Đã Có thẻ");
    _listMessageCard.add("Chưa có thẻ");
    getRefer();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
  @override

  Widget buildFullName() {
    return CustomTextField(
      controller: _fullNameController,
      focusNode: _fullNameFocus,
      textInputAction: TextInputAction.next,
      labelText: "Họ tên",
      prefixIcon: Icons.person,
      onSubmitted: (event) => fieldFocusChange(context, _fullNameFocus, _dateOfBirthFocus),
    );
  }
  Widget buildDateOfBirth() {
    return CustomTextField(
      controller: _dateOfBirthController,
      focusNode: _dateOfBirthFocus,
      textInputAction: TextInputAction.next,
      labelText: "Ngày sinh",
      prefixIcon: Icons.date_range,
      onSubmitted: (event) => fieldFocusChange(context, _dateOfBirthFocus, _passportFocus),
    );
  }
  Widget buildPassport() {
    return CustomTextField(
      controller: _passportController,
      focusNode: _passportFocus,
      textInputAction: TextInputAction.next,
      labelText: "CMND",
      prefixIcon: Icons.credit_card,
      onSubmitted: (event) => fieldFocusChange(context, _passportFocus, _datePassportFocus),
    );
  }
  Widget buildDatePassportCrate() {
    return CustomTextField(
      controller: _datePassportCreateController,
      focusNode: _datePassportFocus,
      textInputAction: TextInputAction.next,
      labelText: "Ngày cấp",
      prefixIcon: Icons.date_range,
      onSubmitted: (event) => fieldFocusChange(context, _datePassportFocus, _phoneFocus),
    );
  }
  Widget buildPhone() {
    return CustomTextField(
      controller: _phoneController,
      focusNode: _phoneFocus,
      textInputAction: TextInputAction.next,
      labelText: "Số điện thoại",
      prefixIcon: Icons.phone,
      onSubmitted: (event) => fieldFocusChange(context, _phoneFocus, _addressFocus),
    );
  }
  Widget buildAddress() {
    return CustomTextField(
      controller: _addressController,
      focusNode: _addressFocus,
      textInputAction: TextInputAction.next,
      labelText: "Địa chỉ",
      prefixIcon: Icons.location_on,
      onSubmitted: (event) => fieldFocusChange(context, _addressFocus, _bankFocus),
    );
  }
  Widget buildBank() {
    return CustomTextField(
      controller: _bankController,
      focusNode: _bankFocus,
      textInputAction: TextInputAction.next,
      labelText: "Ngân hàng",
      prefixIcon: Icons.local_atm,
      onSubmitted: (event) => fieldFocusChange(context, _bankFocus, _idCardFocus),
    );
  }
  Widget buildIdCard() {
    return CustomTextField(
      controller: _idCardController,
      focusNode: _idCardFocus,
      textInputAction: TextInputAction.next,
      labelText: "Mã thẻ",
      prefixIcon: Icons.credit_card,
      onSubmitted: (event) => fieldFocusChange(context, _idCardFocus, _cardLimitFocus),
    );
  }
  Widget buildCardLimit() {
    return CustomTextField(
      controller: _cardLimitController,
      focusNode: _cardLimitFocus,
      textInputAction: TextInputAction.next,
      labelText: "Giới hạn thẻ",
      prefixIcon: Icons.credit_card,
      onSubmitted: (event) => fieldFocusChange(context, _cardLimitFocus, _cardExpiresFocus),
    );
  }
  Widget buildCardExpires() {
    return CustomTextField(
      controller: _cardExpiresController,
      focusNode: _cardExpiresFocus,
      textInputAction: TextInputAction.next,
      labelText: "Ngày hết hạn thẻ",
      prefixIcon: Icons.credit_card,
      onSubmitted: (event) => fieldFocusChange(context, _cardExpiresFocus, _statementDateFocus),
    );
  }
  Widget buildStatementDate() {
    return CustomTextField(
      controller: _statementDateController,
      focusNode: _statementDateFocus,
      textInputAction: TextInputAction.next,
      labelText: "Ngày sao kê",
      prefixIcon: Icons.date_range,
      onSubmitted: (event) => fieldFocusChange(context, _statementDateFocus, _loanFocus),
    );
  }
  Widget buildLoan() {
    return CustomTextField(
      controller: _loanController,
      focusNode: _loanFocus,
      textInputAction: TextInputAction.next,
      labelText: "Số tiền vay",
      prefixIcon: Icons.attach_money,
      onSubmitted: (event) => fieldFocusChange(context, _statementDateFocus, _timeLoanFocus),
    );
  }
  Widget buildTimeLoan() {
    return CustomTextField(
      controller: _timeLoanController,
      focusNode: _timeLoanFocus,
      textInputAction: TextInputAction.next,
      labelText: "Thời gian vay",
      prefixIcon: Icons.date_range,
      onSubmitted: (event) => fieldFocusChange(context, _statementDateFocus, _noteFocus),
    );
  }

  Widget buildNote() {
    return CustomTextField(
      controller: _noteController,
      focusNode: _noteFocus,
      textInputAction: TextInputAction.next,
      labelText: "Ghi chú",
      prefixIcon: Icons.note,
      onSubmitted: (event) => fieldFocusChange(context, _noteFocus, null),
    );
  }
  Widget buildChanel(){
        return CustomText(
          prefixIcon: Icons.label_important,
          text: _chanelName,
          onTap: () => _showBottomDialog(),
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

        setState(() {
          _chanelName = model.name;
        });
        navigatorPop(context);
      },
    );
  }
  _showBottomDialog(){
    showModalBottomSheet(context: context, builder: (context){
      return ListView(
        shrinkWrap: true,
        children: _listChanel.map((model){
          return buildStatusBottomDialog(model);
        }).toList(),
      );
    });
  }
  void postTransaction(){
    TransactionRequest model = new TransactionRequest();
    model.status = 0;
    model.statusDisbursed =0;
    model.statusHandle=0;
    model.bankName = _bankController.text;
    model.iDUserCreate = prefs.getString("iduser");
    model.chanel = _chanelName;
    model.note1 = _noteController.text;
    model.loan = _loanController.text;
    model.timeLoan = _timeLoanController.text;
    model.statementdate = _statementDateController.text;
    model.customer = new Customer();
    model.customer.birthDay = _dateOfBirthController.text;
    model.customer.iDCard = _idCardController.text;
    model.customer.dateCreate = _dateOfBirthController.text;
    model.customer.cardLimit = _cardLimitController.text;
    model.customer.cardExpries = _cardExpiresController.text;
    model.customer.fullName =_fullNameController.text;
    model.customer.passport = _passportController.text;
    model.customer.phone = _phoneController.text;
    model.customer.address =_addressController.text;
    model.customer.dateCreate =_datePassportCreateController.text;
    _bloc.postTransaction(context,model,SeoPage());
  }
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text("Thêm mới"),
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
              buildFullName(),
              Container(height: 10.0,),
              buildDateOfBirth(),
              Container(height: 10.0,),
              buildPassport(),
              Container(height: 10.0,),
              buildDatePassportCrate(),
              Container(height: 10.0,),
              buildPhone(),
              Container(height: 10.0,),
              buildAddress(),
              Container(height: 10.0,),
              buildBank(),
              Container(height: 10.0,),
              buildIdCard(),
              Container(height: 10.0,),
              buildCardLimit(),
              Container(height: 10.0,),
              buildCardExpires(),
              Container(height: 10.0,),
              buildStatementDate(),
              Container(height: 10.0,),
              buildLoan(),
              Container(height: 10.0,),
              buildTimeLoan(),
              Container(height: 10.0,),
              Text("Kênh giải ngân"),
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
