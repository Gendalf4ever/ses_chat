import 'package:flutter/material.dart';
import 'package:ses_chat/components/ses_button.dart';
import 'package:ses_chat/components/ses_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
    });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void  signUp(){

  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                const Icon(
                  Icons.message,
                  size: 80,
                  color: Colors.grey,
                ),
                //welcome back
               const Text('Создадим аккаунт',
                style: TextStyle(
                fontSize: 16,
                 ),
                ),
                const SizedBox(height: 25),
                //email textfield
                SESTextField(
                controller: emailController, 
                hintMessage: 'Введите почту для аутентификации', 
                obscureText: false
                ),
                const SizedBox(height: 25),
                //password textfield
                SESTextField(
                controller: passwordController, 
                hintMessage: 'Введите пароль для аутентификации', 
                obscureText: true //для сокрытия того, что вводишь
                ),
                //confirm password
                    const SizedBox(height: 25),
                //password textfield
                SESTextField(
                controller: confirmPasswordController, 
                hintMessage: 'Подтвердите пароль', 
                obscureText: true //для сокрытия того, что вводишь
                ),
                const SizedBox(height: 25),
                //sign in btn
                SESButton(
                  onTap: signUp,
                  text: "sign up", 
                  ),
                  const SizedBox(height: 50),
                // not a member
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account"),
                    const SizedBox(width:4),
                   GestureDetector(
                    onTap: widget.onTap,
                     child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )
                     ),
                   ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}