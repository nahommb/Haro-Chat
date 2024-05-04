import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haro_chat/widget/chat/messages.dart';
import 'package:haro_chat/widget/chat/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
          children: [
            Expanded(child: Messages()),
             NewMessage()
          ],
        ),
      ),
    );
  }
}
