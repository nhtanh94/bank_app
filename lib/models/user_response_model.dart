class UserResponseModel {
  String iD;
  String account;
  String pass;
  String fullName;
  String email;
  bool sex;
  bool working;
  String iDFunct;
  String token;

UserResponseModel(
      {this.iD,
        this.account,
        this.pass,
        this.fullName,
        this.email,
        this.sex,
        this.working,
        this.iDFunct,
        this.token});

UserResponseModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    account = json['Account'];
    pass = json['Pass'];
    fullName = json['FullName'];
    email = json['Email'];
    sex = json['Sex'];
    working = json['Working'];
    iDFunct = json['IDFunct'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Account'] = this.account;
    data['Pass'] = this.pass;
    data['FullName'] = this.fullName;
    data['Email'] = this.email;
    data['Sex'] = this.sex;
    data['Working'] = this.working;
    data['IDFunct'] = this.iDFunct;
    data['Token'] = this.token;
    return data;
  }
}