import 'package:flutter/material.dart';
class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  })
  {
  return InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlue,
                    width:2 ,
                  ),
                ),
                hintText: hintText,
                labelText: labelText,
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: prefixIcon != null? Icon(prefixIcon, color: Colors.grey[800],):
                Icon(Icons.alternate_email_sharp, color:Colors.grey[800],),

              );
  }
}