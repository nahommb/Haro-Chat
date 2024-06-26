import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:haro_chat/widget/chat/messages.dart';
import 'package:haro_chat/widget/chat/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  @override
  void initState() {
    // TODO: implement initState
    final FirebaseMessaging fbm = FirebaseMessaging.instance;
    fbm.requestPermission();
    FirebaseMessaging.onMessage.listen((event) {
      print(event);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print(event);
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haro chat'),
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert),
              items: [
                DropdownMenuItem(child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app,color: Colors.lightBlue,),
                      SizedBox(width: 2,),
                      Text("Log Out")
                    ],
                  ),
                ),
                    value: 'loggout'
                ),
              ],
              onChanged: (value){
               if(value=='loggout'){
                 FirebaseAuth.instance.signOut();
               }
              })
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Expanded(child: Messages()),
             NewMessage()
          ],
        ),
      ),
    );
  }
}
