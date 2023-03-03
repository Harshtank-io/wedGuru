import 'package:flutter/material.dart';

void showErrorMsg(
    BuildContext context, {
      required String msg,
    }) {
  final snackBar = SnackBar(
    content: Text(
      msg,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessMsg(
    BuildContext context, {
      required String msg,
    }) {
  final snackBar = SnackBar(content: Text(msg));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}