

import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {

  final void Function(String email,String username,String password,bool isLogin) submitFn;

  AuthForm(this.submitFn);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isLogin = true;

  late String userEmail;

  late String userPassword;

  late String userName;

final _formKey = GlobalKey<FormState>();

void _trySubmit(){

  // FocusScope.of(context).unfocus();
  final isValid = _formKey.currentState?.validate();

    if(isValid!){
      _formKey.currentState?.save();
       widget.submitFn(
         userEmail,
         userName,
         userPassword
       );
   }
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value){
                      if(value!.isEmpty || !value!.contains('@')){
                        return 'Please enter valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (value){
                      userEmail = value!;
                    },
                ),
                  if(!isLogin)
                  TextFormField(
                    key: ValueKey('username'),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter username';
                        }
                        return null;
                      },
                    decoration: InputDecoration(labelText:'Username' ),
                  ),
                  TextFormField(
                     key: ValueKey('password'),
                      validator: (value){
                        if(value!.isEmpty || value.length<4){
                          return 'Please enter at list 4 character ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText:'Password' ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    _trySubmit();
                  }, child: Text(isLogin?'Login':'Signup')),
                  TextButton(onPressed: (){
                    setState(() {
                      isLogin = !isLogin;
                    });

                  }, child: Text(isLogin?'Create New Acccount':'I already have An account'))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
