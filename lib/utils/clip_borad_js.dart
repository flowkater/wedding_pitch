import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void copyToClipboard(String text) {
  js.context.callMethod('copyToClipboard', [text]);
}

void clipboardAndAlert({
  required String text,
  required String alertText,
}) async {
  try {
    await Clipboard.setData(
      ClipboardData(
        text: text,
      ),
    );

    Fluttertoast.showToast(
      msg: alertText,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
      webPosition: "center",
      webBgColor: "#4d4d4d",
    );
  } catch (e) {
    copyToClipboard(text);

    Fluttertoast.showToast(
      msg: alertText,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
      webPosition: "center",
      webBgColor: "#4d4d4d",
    );
  }
}
