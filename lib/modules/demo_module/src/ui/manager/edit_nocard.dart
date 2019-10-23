

import 'package:flutter/material.dart';
import 'package:fluttersetup/models/transaction_reponse.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:fluttersetup/widgets/widget.dart';
import '../seo_page.dart';

class EditNoCardPage extends StatefulWidget {
  final TransactionResponse model;

  EditNoCardPage(this.model);
  @override
  _EditNoCardPageState createState() => _EditNoCardPageState();
}
class _EditNoCardPageState extends State<EditNoCardPage> {
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
    _noteController.text = widget.model.note1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cập nhật"),
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

            onPressed: ()=> null,
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
              buildNote(),
            ],
          ),
        ),
      ),
    );
  }
}
