import 'package:flutter/material.dart';
import 'package:ses_chat/pages/login_page.dart';
import 'package:ses_chat/services/auth/login_or_register.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
    );
  }
}