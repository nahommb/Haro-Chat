import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
 String new_message = '';

 void send_message() async{
   FocusScope.of(context).unfocus();
   final user = await FirebaseAuth.instance.currentUser;
   final userData = await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
   FirebaseFirestore.instance.collection('chats').add({
     'text':new_message,
     'createdAt':Timestamp.now(),
     'userId':user?.uid,
     'userName':userData['username'],
   });
 }
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
           Expanded(
             child: TextField(
               controller: textEditingController,
                decoration: InputDecoration(
                  labelText: 'Type here',

                ),
               onChanged: (value){
                  setState(() {
                    new_message = value;

                  });
               },
          ),
           ),
          IconButton(onPressed: (){
            if(new_message!=''&& new_message!=null){
              send_message();
              textEditingController.clear();
            }

          }, icon: Icon(Icons.send))
        ],
      ),
    );
  }
}

