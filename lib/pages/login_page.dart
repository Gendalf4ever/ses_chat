import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:ses_chat/components/ses_button.dart";
import "package:ses_chat/components/ses_textfield.dart";
import "package:ses_chat/services/auth/auth_service.dart";

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
    });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //sign in 
  Future<void> signIn() async {
      final authService = Provider.of<AuthService>(context, listen: false);
      try{
        await authService.signInWithEmailAndPassword(
          emailController.text, 
          passwordController.text
          );
      } catch(e){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.toString()
                )
              )
            );
      }
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
               const Text('Добро пожаловать!',
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
                const SizedBox(height: 25),
                //sign in btn
                SESButton(
                  onTap: signIn,
                  text: "sign in", 
                  ),
                  const SizedBox(height: 50),
                // not a member
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text("Not a member"),
                   const SizedBox(width:4),
                   GestureDetector(
                    onTap: widget.onTap,
                     child: const Text(
                      'Register now',
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