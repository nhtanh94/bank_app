import 'transaction_reponse.dart';

class TransactionResponseModel {
  List<TransactionResponse> data;

  TransactionResponseModel({this.data});

  TransactionResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<TransactionResponse>();
      json['data'].forEach((v) {
        data.add(new TransactionResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}