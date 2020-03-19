import 'package:flushbar/flushbar.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

double currentLatitude = 23.869835;
double currentLongitude = 90.4031033;

Toast_ERROR(context, title, message) {
  Flushbar(
    title: "Hey Ninja",
    message:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    reverseAnimationCurve: Curves.bounceInOut,
    forwardAnimationCurve: Curves.bounceInOut,
    backgroundColor: Colors.deepOrange,
    boxShadows: [
      BoxShadow(
          color: Colors.deepOrange.shade200, offset: Offset(0.0, 2.0), blurRadius: 4)
    ],
    isDismissible: false,
    duration: Duration(seconds: 4),
    titleText: Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(
      message,
      style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
  ).show(context);
}

Toast_WARNING(context, title, message) {
  Flushbar(
    title: "Hey Ninja",
    message:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    reverseAnimationCurve: Curves.bounceInOut,
    forwardAnimationCurve: Curves.bounceInOut,
    backgroundColor: Colors.orange,
    boxShadows: [
      BoxShadow(
          color: Colors.orange.shade200, offset: Offset(0.0, 2.0), blurRadius: 4)
    ],
    isDismissible: false,
    duration: Duration(seconds: 4),
    titleText: Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(
      message,
      style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
  ).show(context);
}

Toast_SUCCESS(context, title, message) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    reverseAnimationCurve: Curves.elasticIn,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Colors.green.shade700,
    boxShadows: [
      BoxShadow(
          color: Colors.black12, offset: Offset(0.0, 2.0), blurRadius: 4)
    ],
    isDismissible: false,
    duration: Duration(seconds: 4),
    titleText: Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(
      message,
      style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
  ).show(context);
}

double check(String val) {
  return val==null || val=="" || val== " " ? null : double.parse(val);
}
