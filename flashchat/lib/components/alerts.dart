import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void alertFun(
    BuildContext context, String title, String descrip, AlertType alertType) {
  Alert(
    context: context,
    type: alertType,
    title: title,
    desc: descrip,
    style: AlertStyle(
      backgroundColor: Colors.white,
    ),
    buttons: [
      DialogButton(
        color: Colors.blueGrey,
        child: Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}

void errorCheck(BuildContext context, String errorMessage) {
  if (errorMessage == 'email-already-in-use') {
    /* show the pop up window */
    alertFun(
        context, 'Error', 'This Email is already in use!', AlertType.warning);
  } else if (errorMessage == 'weak-password') {
    alertFun(context, 'Error', 'Password must be more than 6 characters!',
        AlertType.warning);
  } else if (errorMessage == 'invalid-credential') {
    alertFun(context, 'Error', 'Email is not registered on this app!',
        AlertType.error);
  } else if (errorMessage == 'invalid-email') {
    alertFun(context, 'Error', 'Invalid Email!', AlertType.error);
  } else if (errorMessage == 'channel-error') {
    alertFun(context, 'Error', 'Empty Field!', AlertType.error);
  } else {
    alertFun(
      context,
      'Error',
      'Unknown error!\n try again',
      AlertType.error,
    );
  }
}

void toastFun(String title) {
  Fluttertoast.showToast(
      msg: title,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.blue,
      fontSize: 16.0);
}
