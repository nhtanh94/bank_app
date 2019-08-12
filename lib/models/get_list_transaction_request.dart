class getListTransactionRequest {
  String iDuser;
  int offset;
  int limit;

  getListTransactionRequest({this.iDuser, this.offset, this.limit});

  getListTransactionRequest.fromJson(Map<String, dynamic> json) {
    iDuser = json['IDuser'];
    offset = json['offset'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDuser'] = this.iDuser;
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    return data;
  }
}