import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseFirestore.instance.collection('chats').snapshots(),
      builder:(ctx,snapShots){
      final data = snapShots.data?.docs;
      if(snapShots.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
      }
      return ListView.builder(
        reverse: true,
        itemCount: data?.length,
        itemBuilder: (ctx,index){
        return Text(data?[index]['text']);
      },);
      } ,
    );
  }
}
