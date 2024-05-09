
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:haro_chat/widget/image_picker.dart';

class AuthForm extends StatefulWidget {

  final void Function(String email,String username,String password,bool isLogin , BuildContext ctx) submitFn;
  final isLoading ;

  AuthForm({required this.submitFn,required this.isLoading});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isLogin = true;

  late String userEmail;

  late String userPassword;

  late String userName ='';

final _formKey = GlobalKey<FormState>();
File?userImage ;

void _pickedImage(File image){
 userImage = image;
}

void _trySubmit(){
   if(userImage==null && !isLogin){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please pick image')));
     return;
   }
  // FocusScope.of(context).unfocus();
  final isValid = _formKey.currentState?.validate();

    if(isValid!){
      _formKey.currentState?.save();
       widget.submitFn(
         userEmail.trim(),
         userName.trim(),
         userPassword.trim(),
         isLogin,
         context
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
                  if(!isLogin)CustomImagePicker(imagePickerFn: _pickedImage),
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
                    onSaved: (val){
                      userName= val!;
                    },
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
                    onSaved: (val){
                       userPassword = val!;
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 20,),
                  if(widget.isLoading)CircularProgressIndicator(),
                  if(!widget.isLoading)
                  ElevatedButton(onPressed: (){
                    _trySubmit();
                  }, child: Text(isLogin?'Login':'Signup')),
                  if(!widget.isLoading)
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
