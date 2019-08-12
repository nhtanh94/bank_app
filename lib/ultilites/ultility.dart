import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import './progress_dialog.dart';

ProgressDialog pr;

showProgressDialog(BuildContext context) {
  pr = ProgressDialog(context);
  pr.show();
}

hideProgressDialog() {
  if(pr != null)
    if (pr.isShowing()) {
      pr.hide();
      pr = null;
    }
}

showMsDialog(BuildContext context,String title,String msg){
 showDialog(context: context,
 builder: (context)=>AlertDialog(
   title: Text(title),
   content: Text(msg),
   actions: <Widget>[
     new FlatButton(onPressed: (){Navigator.of(context).pop(showMsDialog);}, child: Text("OK"))
   ],
 )
 );
}

hideKeyboard(){
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

fieldFocusChange(BuildContext context, FocusNode present, FocusNode after){
  present.unfocus();
  FocusScope.of(context).requestFocus(after);
}

navigatorPushReplacement(BuildContext context, Widget screen, bool root){
  Navigator.of(context, rootNavigator: root).pushReplacement(
      MaterialPageRoute(
          builder: (context) => screen
      )
  );
}

navigatorPush(BuildContext context, Widget screen, bool root) async {
  return await Navigator.of(context, rootNavigator: root).push(
      MaterialPageRoute(
          builder: (context) => screen
      )
  );
}

navigatorPop(BuildContext context){
  Navigator.of(context).pop();
}

navigatorPopWithData(BuildContext context, dynamic object){
  Navigator.of(context).pop(object);
}

openAlertDialog(BuildContext context, String title, String content) async {
  return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            SimpleDialogOption(
              child: Text("Đồng ý"),
              onPressed: () => navigatorPop(context),
            )
          ],
        );
      }
  );
}

openAlertDialogWithFunction(BuildContext context, String title, String content, Function onPress) async {
  return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            SimpleDialogOption(
              child: Text("Cancel"),
              onPressed: () => navigatorPop(context),
            ),
            SimpleDialogOption(
              child: Text("Agree"),
              onPressed: onPress,
            )
          ],
        );
      }
  );
}

configKeyboardActions(List<KeyboardAction> actions){
  return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: actions
  );
}

KeyboardAction buildKeyboardAction(FocusNode node) {
  return KeyboardAction(
    focusNode: node,
    closeWidget: Padding(
      padding: EdgeInsets.all(9.0),
      child: Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}