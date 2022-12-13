import 'package:flutter/material.dart';
class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messageKey = new GlobalKey<ScaffoldMessengerState>();

  static shawnSnakbar (String message){
    final snakbar = new SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );

    messageKey.currentState!.showSnackBar(snakbar);
  }
}