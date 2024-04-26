import 'package:flutter/material.dart';
import 'package:haro_chat/widget/auth_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:AuthForm()
      ),
    );
  }
}
