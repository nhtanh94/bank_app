import 'customer_reponse.dart';

class TransactionResponse {
  String iD;
  String iDUserCreate;
  String iDCustomer;
  String iDUserUpdate;
  String dateCreate;
  String dateUpdate;
  String dateDisbursed;
  String bankName;
  int months;
  String transferFees;
  String amountDisbursed;
  String referCode;
  String remittanceCode;
  String chanel;
  int status;
  String note1;
  String note2;
  String note3;
  String transactionStatus;
  CustomerResponse customer;

  TransactionResponse(
      {this.iD,
        this.iDUserCreate,
        this.iDCustomer,
        this.iDUserUpdate,
        this.dateCreate,
        this.dateUpdate,
        this.dateDisbursed,
        this.bankName,
        this.months,
        this.transferFees,
        this.amountDisbursed,
        this.referCode,
        this.remittanceCode,
        this.chanel,
        this.status,
        this.note1,
        this.note2,
        this.note3,
        this.transactionStatus,
        this.customer});

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    iDUserCreate = json['IDUserCreate'];
    iDCustomer = json['IDCustomer'];
    iDUserUpdate = json['IDUserUpdate'];
    dateCreate = json['DateCreate'];
    dateUpdate = json['DateUpdate'];
    dateDisbursed = json['DateDisbursed'];
    bankName = json['BankName'];
    months = json['Months'];
    transferFees = json['TransferFees'];
    amountDisbursed = json['AmountDisbursed'];
    referCode = json['ReferCode'];
    remittanceCode = json['RemittanceCode'];
    chanel = json['Chanel'];
    status = json['Status'];
    note1 = json['Note1'];
    note2 = json['Note2'];
    note3 = json['Note3'];
    transactionStatus = json['TransationStatus'];
    customer = json['Customer'] != null
        ? new CustomerResponse.fromJson(json['Customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['IDUserCreate'] = this.iDUserCreate;
    data['IDCustomer'] = this.iDCustomer;
    data['IDUserUpdate'] = this.iDUserUpdate;
    data['DateCreate'] = this.dateCreate;
    data['DateUpdate'] = this.dateUpdate;
    data['DateDisbursed'] = this.dateDisbursed;
    data['BankName'] = this.bankName;
    data['Months'] = this.months;
    data['TransferFees'] = this.transferFees;
    data['AmountDisbursed'] = this.amountDisbursed;
    data['ReferCode'] = this.referCode;
    data['RemittanceCode'] = this.remittanceCode;
    data['Chanel'] = this.chanel;
    data['Status'] = this.status;
    data['Note1'] = this.note1;
    data['Note2'] = this.note2;
    data['Note3'] = this.note3;
    data['TransationStatus'] = this.transactionStatus;
    if (this.customer != null) {
      data['Customer'] = this.customer.toJson();
    }
    return data;
  }
}