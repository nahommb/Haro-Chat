import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haro_chat/screen/auth_screen.dart';
import 'package:haro_chat/screen/chat_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized(

  );
  await Firebase.initializeApp(

  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),builder: (context,userSnapshot){
        if(userSnapshot.hasData){
          return ChatScreen();
        }
        return AuthScreen();
      },),
    );
  }
}
