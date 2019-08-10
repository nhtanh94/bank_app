library progress_dialog;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProgressDialog {
  bool _isShowing = false;

  BuildContext buildContext;

  ProgressDialog(this.buildContext);

  void show() {
    _showDialog();
    _isShowing = true;
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide() {
    _isShowing = false;
    Navigator.of(buildContext).pop();
  }

  _showDialog() {
    Navigator.push(buildContext,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.3),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}