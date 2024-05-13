import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haro_chat/widget/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.value(FirebaseAuth.instance.currentUser),
      builder:(context,futureSnap){
        if(futureSnap.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
      return StreamBuilder(stream: FirebaseFirestore.instance.collection('chats').orderBy('createdAt',descending: true).snapshots(),
        builder:(ctx,snapShots){
          final data = snapShots.data?.docs;
          if(snapShots.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
            reverse: true,
            itemCount: data?.length,
            itemBuilder: (ctx,index){
              return MessageBubble(
                message_text:data?[index]['text'],
                isMe: data?[index]['userId']== futureSnap.data?.uid,
                username: data?[index]['userName'],
                userimage: data?[index]['userImage'],);
            },);
        },
      );
      } ,
    );
  }
}
