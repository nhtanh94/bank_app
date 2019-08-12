class CustomerRequest {
  String iD;
  String fullName;
  String birthDay;
  String address;
  String passport;
  String phone;
  String email;
  String iDCard;
  String cardExpries;
  bool haveCard;
  String dateCreate;

  CustomerRequest(
      {this.iD,
        this.fullName,
        this.birthDay,
        this.address,
        this.passport,
        this.phone,
        this.email,
        this.iDCard,
        this.cardExpries,
        this.haveCard,
        this.dateCreate});

  CustomerRequest.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    fullName = json['FullName'];
    birthDay = json['BirthDay'];
    address = json['Address'];
    passport = json['Passport'];
    phone = json['Phone'];
    email = json['Email'];
    iDCard = json['IDCard'];
    cardExpries = json['CardExpries'];
    haveCard = json['HaveCard'];
    dateCreate = json['DateCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['FullName'] = this.fullName;
    data['BirthDay'] = this.birthDay;
    data['Address'] = this.address;
    data['Passport'] = this.passport;
    data['Phone'] = this.phone;
    data['Email'] = this.email;
    data['IDCard'] = this.iDCard;
    data['CardExpries'] = this.cardExpries;
    data['HaveCard'] = this.haveCard;
    data['DateCreate'] = this.dateCreate;
    return data;
  }
}