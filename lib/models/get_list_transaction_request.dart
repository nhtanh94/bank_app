class getListTransactionRequest {
  String iDuser;
  int offset;
  int limit;
  int status;
  getListTransactionRequest({this.iDuser, this.offset, this.limit,this.status});

  getListTransactionRequest.fromJson(Map<String, dynamic> json) {
    iDuser = json['IDuser'];
    offset = json['offset'];
    limit = json['limit'];
    status =json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDuser'] = this.iDuser;
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['status'] = this.status;
    return data;
  }
}