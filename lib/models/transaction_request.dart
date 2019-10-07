import 'package:fluttersetup/models/customer_request.dart';
class TransactionRequest {
  String iDUserCreate;
  String bankName;
  int months;
  String referCode;
  String chanel;
  int status;
  String note1;
  CustomerRequest customer;
  TransactionRequest(
      {
        this.iDUserCreate,
        this.bankName,
        this.months,
        this.referCode,
        this.chanel,
        this.status,
        this.note1,
        this.customer});

  TransactionRequest.fromJson(Map<String, dynamic> json) {
    iDUserCreate = json['IDUserCreate'];
    bankName = json['BankName'];
    months = json['Months'];
    referCode = json['ReferCode'];
    chanel = json['Chanel'];
    status = json['Status'];
    note1 = json['Note1'];
    customer = json['Customer'] != null
        ? new CustomerRequest.fromJson(json['Customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDUserCreate'] = this.iDUserCreate;
    data['BankName'] = this.bankName;
    data['Months'] = this.months;
    data['ReferCode'] = this.referCode;
    data['Chanel'] = this.chanel;
    data['Status'] = this.status;
    data['Note1'] = this.note1;
    if (this.customer != null) {
      data['Customer'] = this.customer.toJson();
    }
    return data;
  }
}