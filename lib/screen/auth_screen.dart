import 'package:flutter/material.dart';
import 'package:haro_chat/widget/auth_form.dart';

class AuthScreen extends StatelessWidget {
  void _submitAuthForm( String email,String username,String password,bool islogin){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:AuthForm(_submitAuthForm)
      ),
    );
  }
}
