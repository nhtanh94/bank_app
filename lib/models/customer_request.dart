class CustomerRequest {
  String fullName;
  String address;
  String passport;
  String phone;
  String email;
  String iDCard;
  String cardExpries;
  bool haveCard;

  CustomerRequest(
      {
        this.fullName,
        this.address,
        this.passport,
        this.phone,
        this.email,
        this.iDCard,
        this.cardExpries,
        this.haveCard});

  CustomerRequest.fromJson(Map<String, dynamic> json) {
    fullName = json['FullName'];
    address = json['Address'];
    passport = json['Passport'];
    phone = json['Phone'];
    email = json['Email'];
    iDCard = json['IDCard'];
    cardExpries = json['CardExpries'];
    haveCard = json['HaveCard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FullName'] = this.fullName;
    data['Address'] = this.address;
    data['Passport'] = this.passport;
    data['Phone'] = this.phone;
    data['Email'] = this.email;
    data['IDCard'] = this.iDCard;
    data['CardExpries'] = this.cardExpries;
    data['HaveCard'] = this.haveCard;
    return data;
  }
}