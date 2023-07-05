import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

commonToaster({required String message, required Color backgroundColor}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
