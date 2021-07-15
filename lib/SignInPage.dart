import 'package:benda/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<AuthentificationService>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                },
                child: Text("Sign In"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthentificationService>().signUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                },
                child: Text("Sign Up"),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),

    );
  }
}
