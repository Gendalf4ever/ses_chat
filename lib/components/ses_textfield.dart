import 'package:flutter/material.dart';
//кастомный текстфиелд СЭЭЭЭЭЭС логин
class SESTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintMessage;
  final bool obscureText;
  const SESTextField({
    super.key,
    required this.controller, 
    required this.hintMessage, 
    required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 3
        ), 
        ),
        focusedBorder:  OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white
        ), 
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintMessage,
        hintStyle: TextStyle(
          color: Colors.black
        )
      )
    );
  }
}