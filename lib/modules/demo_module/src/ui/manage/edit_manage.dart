import 'package:flutter/material.dart';
import 'package:fluttersetup/models/status_model.dart';
import 'package:fluttersetup/models/transaction_reponse.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/edit_nocard_bloc.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/manage/manage_page.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:fluttersetup/widgets/widget.dart';
import 'package:fluttersetup/models/transaction_request.dart' as request;

class EditManagePage extends StatefulWidget {
  final TransactionResponse model;

  EditManagePage(this.model);
  @override
  _EditManagePageState createState() => _EditManagePageState();
}

class _EditManagePageState extends State<EditManagePage> {

  List<StatusModel> _listProcess = List<StatusModel>();
  List<StatusModel> _listStatus = List<StatusModel>();
  List<StatusModel> _listDisbursedStatus = List<StatusModel>();
  StatusModel modelProcess = StatusModel();
  StatusModel modelStatus = StatusModel();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _passportController = TextEditingController();
  TextEditingController _datePassportCreateController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _bankController = TextEditingController();
  TextEditingController _idCardController = TextEditingController();
  TextEditingController _cardLimitController = TextEditingController();
  TextEditingController _statementDateController = TextEditingController();
  TextEditingController _loanController = TextEditingController();
  TextEditingController _timeLoanController = TextEditingController();
  TextEditingController _chanelController = TextEditingController();
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
  final FocusNode _statementDateFocus = FocusNode();
  final FocusNode _loanFocus = FocusNode();
  final FocusNode _timeLoanFocus = FocusNode();
  final FocusNode _chanelFocus = FocusNode();
  final FocusNode _noteFocus = FocusNode();
  EditNoCardBloc _bloc;
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
      labelText: "Ngày hết hạn thẻ",
      prefixIcon: Icons.credit_card,
      onSubmitted: (event) => fieldFocusChange(context, _cardLimitFocus, _statementDateFocus),
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
      onSubmitted: (event) => fieldFocusChange(context, _statementDateFocus, _chanelFocus),
    );
  }
  Widget buildChanel() {
    return CustomTextField(
      controller: _chanelController,
      focusNode: _chanelFocus,
      textInputAction: TextInputAction.next,
      labelText: "Kênh giải ngân",
      prefixIcon: Icons.beenhere,
      onSubmitted: (event) => fieldFocusChange(context, _chanelFocus, _noteFocus),
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


  //build handle
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
  Widget buildStatusHandle(){
    return CustomText(
      colorChanel: Colors.blueAccent,
      prefixIcon: Icons.label_important,
      text: _getStatusHandelTransaction(widget.model.statusHandle),
      onTap: () => _showHandleStatusBottomDialog(),
    );
  }
  Widget buildStatusHandleBottomDialog(StatusModel model){
    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              model.name,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          CustomLine()
        ],
      ),
      onTap: (){
        setState(() {
          widget.model.statusHandle = model.id;
          navigatorPop(context);
        });
      },
    );
  }
  _showHandleStatusBottomDialog(){
    showModalBottomSheet(context: context, builder: (context){
      return ListView(
        shrinkWrap: true,
        children: _listProcess.map((model){
          return buildStatusHandleBottomDialog(model);
        }).toList(),
      );
    });
  }
  //end build handle


  //build sttGN
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
  Widget buildStatusDisbursed(){
    return CustomText(
      colorChanel: Colors.green,
      prefixIcon: Icons.label_important,
      text: _getStatusDisbursedTransaction(widget.model.statusDisbursed),
      onTap: () => _showStatusDisbursedBottomDialog(),
    );
  }
  Widget buildStatusDisbursedBottomDialog(StatusModel model){
    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              model.name,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          CustomLine()
        ],
      ),
      onTap: (){
        setState(() {
          widget.model.statusDisbursed = model.id;
          navigatorPop(context);
        });
      },
    );
  }
  _showStatusDisbursedBottomDialog(){
    showModalBottomSheet(context: context, builder: (context){
      return ListView(
        shrinkWrap: true,
        children: _listDisbursedStatus.map((model){
          return buildStatusDisbursedBottomDialog(model);
        }).toList(),
      );
    });
  }
  //end build sttGN

 //build Status
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

  Widget buildStatus(){
    return CustomText(
      colorChanel: Colors.redAccent,
      prefixIcon: Icons.label_important,
      text: _getSttName(widget.model.status),
      onTap: () => _showStatusBottomDialog(),
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
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          CustomLine()
        ],
      ),
      onTap: (){
        setState(() {
          widget.model.status = model.id;
          navigatorPop(context);
        });
      },
    );
  }


  _showStatusBottomDialog(){
    showModalBottomSheet(context: context, builder: (context){
      return ListView(
        shrinkWrap: true,
        children: _listStatus.map((model){
          return buildStatusBottomDialog(model);
        }).toList(),
      );
    });
  }

  //end build Status

  putHandelTransaction(){
    request.TransactionRequest model = request.TransactionRequest();
    model.iD = widget.model.iD;
    model.bankName = _bankController.text;
    model.status = widget.model.status;
    model.statusDisbursed = widget.model.statusDisbursed;
    model.statusHandle = widget.model.statusHandle;
    model.statementdate = _statementDateController.text;
    model.chanel = _chanelController.text;
    model.loan = _loanController.text;
    model.timeLoan = _timeLoanController.text;
    model.statementdate = _statementDateController.text;
    model.customer = new request.Customer();
    model.customer.fullName = _fullNameController.text;
    model.customer.birthDay = _dateOfBirthController.text;
    model.customer.phone = _phoneController.text;
    model.customer.passport = _passportController.text;
    model.customer.address =_addressController.text;
    model.customer.iDCard = _idCardController.text;
    model.customer.cardLimit = _cardLimitController.text;
    model.customer.dateCreate = _datePassportCreateController.text;
    model.note1 = _noteController.text;
    model.statusHandle = widget.model.statusHandle;
    model.status = widget.model.status;
    _bloc.putNoCardTransaction(context, model, ManagePage());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cập nhật"),
        leading: FlatButton(onPressed: ()=>navigatorPushReplacement(context,ManagePage(),true), child: Icon(Icons.arrow_back)),
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

            onPressed: ()=> putHandelTransaction(),
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
              Text("Trạng thái"),
              buildStatus(),
              Container(height: 10.0,),
              Text("Bước xử lý"),
              buildStatusHandle(),
              Container(height: 10.0,),
              Text("Bước giải ngân"),
              buildStatusDisbursed(),
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
              buildStatementDate(),
              Container(height: 10.0,),
              buildLoan(),
              Container(height: 10.0,),
              buildTimeLoan(),
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fullNameController.text = widget.model.customer.fullName;
    _dateOfBirthController.text = widget.model.customer.birthDay;
    _passportController.text = widget.model.customer.passport;
    _datePassportCreateController.text = widget.model.customer.dateCreate;
    _phoneController.text = widget.model.customer.phone;
    _addressController.text =widget.model.customer.phone;
    _bankController.text = widget.model.bankName;
    _idCardController.text = widget.model.customer.iDCard;
    _cardLimitController.text = widget.model.customer.cardLimit;
    _statementDateController.text = widget.model.statementdate;
    _loanController.text = widget.model.loan;
    _timeLoanController.text = widget.model.timeLoan;
    _chanelController.text = widget.model.chanel;
    _noteController.text = widget.model.note1;
    _listProcess..add(StatusModel(
        id: 0,
        name: ""
    ))..add(StatusModel(
        id: 1,
        name: "Phone"
    ))..add(StatusModel(
        id: 2,
        name: "FU"
    ))..add(StatusModel(
        id: 3,
        name: "Bổ sung chứng từ"
    ))..add(StatusModel(
        id: 4,
        name: "RJ"
    ))..add(StatusModel(
        id: 5,
        name: "AppRove"
    ));
    _listStatus..add(StatusModel(
        id: 0,
        name: "Đã có thẻ"
    ))..add(StatusModel(
        id: 1,
        name: "Đăng ký thẻ"
    ));
    _listDisbursedStatus..add(StatusModel(
        id: 0,
        name: "Chờ nhận thẻ"
    ))..add(StatusModel(
        id: 1,
        name: "Chờ giải ngân"
    ))..add(StatusModel(
        id: 2,
        name: "Đã giải ngân"
    ));
    _bloc = EditNoCardBloc();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
}
