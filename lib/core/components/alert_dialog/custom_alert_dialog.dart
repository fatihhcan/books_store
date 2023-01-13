import 'package:books_store/core/constants/text/text_constants.dart';
import 'package:flutter/material.dart';
customShowAlertDialog(BuildContext context) {


  Widget okButton = TextButton(
    child: const Text(TextConstants.alertOk),
    onPressed: () => Navigator.pop(context),
  );


  AlertDialog alert = AlertDialog(
    title: const Text(TextConstants.alertMessage),
    actions: [
      okButton,
    ],
  );


  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}