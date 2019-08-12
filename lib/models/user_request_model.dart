class UserRequestModel {
  String account;
  String pass;

  UserRequestModel({this.account, this.pass});

  UserRequestModel.fromJson(Map<String, dynamic> json) {
    account = json['Account'];
    pass = json['Pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Account'] = this.account;
    data['Pass'] = this.pass;
    return data;
  }
}