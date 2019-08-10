import 'package:flutter/material.dart';
import 'package:fluttersetup/models/demo_model.dart';
import 'package:fluttersetup/modules/demo_module/src/bloc/demo_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DemoScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DemoScreen> {

  DemoBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = DemoBloc();

    WidgetsBinding.instance.addPostFrameCallback((_) => _bloc.getModel(context));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo"),),
      body: StreamBuilder(
        stream: _bloc.outputModel,
        initialData: null,
        builder: (context, snapshot){
          DemoModel model = snapshot.data;
          return model == null?Container():GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            shrinkWrap: true,
            children: model.demos.map((model){
              return CachedNetworkImage(
                imageUrl: model.url,
                fit: BoxFit.contain,
                placeholder: (context,_){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
