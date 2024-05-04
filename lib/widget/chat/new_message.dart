import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
 String new_message = '';

 void send_message(){
   FocusScope.of(context).unfocus();
   FirebaseFirestore.instance.collection('chats').add({
     'text':new_message,
     'createdAt':Timestamp.now()
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

