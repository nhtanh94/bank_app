import 'package:fluttersetup/common/interactions.dart';
import 'package:fluttersetup/models/demo_model.dart';
import 'package:fluttersetup/resources/repositories.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class DemoBloc{
  final _repository = Repositories();

  final _streamModel = BehaviorSubject<DemoModel>();

  Observable<DemoModel> get outputModel => _streamModel.stream;

  setModel(DemoModel event) => _streamModel.sink.add(event);

  getModel(BuildContext context) async {
    showProgressDialog(context);
    ApiResponseData response = await _repository.demo(context);
    hideProgressDialog();
    if(response.errorCode == 0){
      DemoModel model = DemoModel.fromJson(response.data);
      setModel(model);
    }
  }

  dispose(){
    _streamModel.close();
  }
}