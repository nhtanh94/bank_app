

import 'package:flutter/material.dart';
import 'package:fluttersetup/models/status_model.dart';
import 'package:fluttersetup/models/transaction_reponse.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/edit_nocard_bloc.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/handle/handle_page.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:fluttersetup/widgets/widget.dart';
import 'package:fluttersetup/models/transaction_request.dart' as request;
class EditHandlePage extends StatefulWidget {
  final TransactionResponse model;

  EditHandlePage(this.model);
  @override
  _EditHandlePageState createState() => _EditHandlePageState();
}

class _EditHandlePageState extends State<EditHandlePage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _passportController = TextEditingController();
  TextEditingController _datePassportCreateController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  // focusText field
  final FocusNode _fullNameFocus = FocusNode();
  final FocusNode _dateOfBirthFocus = FocusNode();
  final FocusNode _passportFocus = FocusNode();
  final FocusNode _datePassportFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _noteFocus = FocusNode();
  List<StatusModel> _listProcess = List<StatusModel>();
  List<StatusModel> _listStatus = List<StatusModel>();
  StatusModel modelProcess = StatusModel();
  StatusModel modelStatus = StatusModel();
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
      onSubmitted: (event) => fieldFocusChange(context, _addressFocus, _noteFocus),
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


  Widget buildStatus(){
    return CustomText(
      colorChanel: Colors.redAccent,
      prefixIcon: Icons.label_important,
      text: _getSttName(widget.model.status),
      onTap: () => _showStatusBottomDialog(),
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullNameController.text = widget.model.customer.fullName;
    _dateOfBirthController.text = widget.model.customer.birthDay;
    _passportController.text = widget.model.customer.passport;
    _datePassportCreateController.text = widget.model.customer.dateCreate;
    _phoneController.text = widget.model.customer.phone;
    _addressController.text =widget.model.customer.address;
    _noteController.text = widget.model.note1;
    _bloc = EditNoCardBloc();
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
  }
  putHandelTransaction(){
    request.TransactionRequest model = request.TransactionRequest();
    model.iD = widget.model.iD;
    model.statusDisbursed = widget.model.statusDisbursed;
    model.customer = new request.Customer();
    model.customer.fullName = _fullNameController.text;
    model.customer.birthDay = _dateOfBirthController.text;
    model.customer.phone = _phoneController.text;
    model.customer.passport = _passportController.text;
    model.customer.address =_addressController.text;
    model.customer.dateCreate = _datePassportCreateController.text;
    model.note1 = _noteController.text;
    model.statusHandle = widget.model.statusHandle;
    model.status = widget.model.status;
    _bloc.putNoCardTransaction(context, model, HandlePage());
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cập nhật"),
        leading: FlatButton(onPressed: ()=>navigatorPush(context,HandlePage(),true), child: Icon(Icons.arrow_back)),
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
              buildNote(),
            ],
          ),
        ),
      ),
    );
  }
}
