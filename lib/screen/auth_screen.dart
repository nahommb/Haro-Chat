import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:haro_chat/widget/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var isLoading = false;

  final _auth = FirebaseAuth.instance;

  void _submitAuthForm ( String email,String username,String password,bool islogin,BuildContext ctx,File image) async {
    final _auth_result ;

    try{
      setState(() {
        isLoading = true;
      });
      if(islogin){
        final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
        _auth_result = userCredential.user;

      }
      else{
        final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        _auth_result = userCredential.user;

      }
     final ref = await FirebaseStorage.instance.ref().child('user_image').child(_auth_result.uid+'jpg');
        ref.putFile(image);

      await FirebaseFirestore.instance.collection('users').doc(_auth_result.uid).set({
        'email':email,
        'username':username
      });
    }
    on FirebaseAuthException catch(err){
      String? message ='check your credentials';
      if(err.message!=null){
        message = err.message;
      }
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(message!)));
    }
    catch(err){
      print(err);
      setState(() {
        isLoading = false;
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:AuthForm(submitFn: _submitAuthForm,isLoading:isLoading)
      ),
    );
  }
}
