import 'customer_reponse.dart';

class TransactionResponse {
  String iD;
  String iDUserCreate;
  String iDCustomer;
  String iDUserUpdate;
  String nameUser;
  String moneyReciveCode;
  String dateCreate;
  String dateUpdate;
  String dateDisbursed;
  String bankName;
  String timeLoan;
  String referCode;
  String transferFees;
  String loan;
  String chanel;
  String note1;
  int status;
  int statusHandle;
  String statementdate;
  int statusDisbursed;
  Customer customer;

  TransactionResponse(
      {this.iD,
        this.iDUserCreate,
        this.iDCustomer,
        this.iDUserUpdate,
        this.nameUser,
        this.moneyReciveCode,
        this.dateCreate,
        this.dateUpdate,
        this.dateDisbursed,
        this.bankName,
        this.timeLoan,
        this.referCode,
        this.transferFees,
        this.loan,
        this.chanel,
        this.note1,
        this.status,
        this.statusHandle,
        this.statementdate,
        this.statusDisbursed,
        this.customer});

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    iDUserCreate = json['IDUserCreate'];
    iDCustomer = json['IDCustomer'];
    iDUserUpdate = json['IDUserUpdate'];
    nameUser = json['NameUser'];
    moneyReciveCode = json['MoneyReciveCode'];
    dateCreate = json['DateCreate'];
    dateUpdate = json['DateUpdate'];
    dateDisbursed = json['DateDisbursed'];
    bankName = json['BankName'];
    timeLoan = json['TimeLoan'];
    referCode = json['ReferCode'];
    transferFees = json['TransferFees'];
    loan = json['Loan'];
    chanel = json['Chanel'];
    note1 = json['Note1'];
    status = json['Status'];
    statusHandle = json['StatusHandle'];
    statementdate = json['Statementdate'];
    statusDisbursed = json['StatusDisbursed'];
    customer = json['Customer'] != null
        ? new Customer.fromJson(json['Customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['IDUserCreate'] = this.iDUserCreate;
    data['IDCustomer'] = this.iDCustomer;
    data['IDUserUpdate'] = this.iDUserUpdate;
    data['NameUser'] = this.nameUser;
    data['MoneyReciveCode'] = this.moneyReciveCode;
    data['DateCreate'] = this.dateCreate;
    data['DateUpdate'] = this.dateUpdate;
    data['DateDisbursed'] = this.dateDisbursed;
    data['BankName'] = this.bankName;
    data['TimeLoan'] = this.timeLoan;
    data['ReferCode'] = this.referCode;
    data['TransferFees'] = this.transferFees;
    data['Loan'] = this.loan;
    data['Chanel'] = this.chanel;
    data['Note1'] = this.note1;
    data['Status'] = this.status;
    data['StatusHandle'] = this.statusHandle;
    data['Statementdate'] = this.statementdate;
    data['StatusDisbursed'] = this.statusDisbursed;
    if (this.customer != null) {
      data['Customer'] = this.customer.toJson();
    }
    return data;
  }
}

class Customer {
  String iD;
  String fullName;
  String birthDay;
  String address;
  String cardLimit;
  String passport;
  String dateOfIssue;
  String phone;
  String iDCard;
  String cardExpries;
  String dateCreate;

  Customer(
      {this.iD,
        this.fullName,
        this.birthDay,
        this.address,
        this.cardLimit,
        this.passport,
        this.dateOfIssue,
        this.phone,
        this.iDCard,
        this.cardExpries,
        this.dateCreate});

  Customer.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    fullName = json['FullName'];
    birthDay = json['BirthDay'];
    address = json['Address'];
    cardLimit = json['CardLimit'];
    passport = json['Passport'];
    dateOfIssue = json['DateOfIssue'];
    phone = json['Phone'];
    iDCard = json['IDCard'];
    cardExpries = json['CardExpries'];
    dateCreate = json['DateCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['FullName'] = this.fullName;
    data['BirthDay'] = this.birthDay;
    data['Address'] = this.address;
    data['CardLimit'] = this.cardLimit;
    data['Passport'] = this.passport;
    data['DateOfIssue'] = this.dateOfIssue;
    data['Phone'] = this.phone;
    data['IDCard'] = this.iDCard;
    data['CardExpries'] = this.cardExpries;
    data['DateCreate'] = this.dateCreate;
    return data;
  }
}