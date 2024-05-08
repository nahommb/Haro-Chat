import 'package:flutter/material.dart';
class MessageBubble extends StatelessWidget {
  final message_text;
  bool isMe;
  final username;
  MessageBubble({this.message_text,required this.isMe,this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe?MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        FittedBox(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isMe?Colors.lightBlue:Colors.greenAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Text(username),
                    SizedBox(height: 8,),
                    Text(message_text,textAlign: TextAlign.center,),
                  ],
                )),
          ),
        ),

        // Container(
        //   margin: EdgeInsets.all(8),
        //   width: 50,
        //   height: 40,
        //   decoration: BoxDecoration(
        //     color: Colors.greenAccent,
        //
        //   ),
        //   child: ,
        // ),
      ],
    );
  }
}
