import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chats/4pMZzbx7Xp6f3zPshOwl/messages').snapshots(),
        builder:(ctx,streamSnap){
          final documnets = streamSnap.data?.docs;
          if(streamSnap.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemBuilder:(ctx,index)=>Text(documnets?[index]['text']) ,
            itemCount: documnets?.length,
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Add"),
        onPressed: (){
          FirebaseFirestore.instance.collection('chats/4pMZzbx7Xp6f3zPshOwl/messages').add({
            'text':"first message"
          });

        },
      ),
    );
  }
}
