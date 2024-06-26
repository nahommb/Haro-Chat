import 'package:flutter/material.dart';
class MessageBubble extends StatelessWidget {
  final message_text;
  bool isMe;
  final username;
  final userimage;
  MessageBubble({this.message_text,required this.isMe,this.username,this.userimage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: isMe?MainAxisAlignment.end:MainAxisAlignment.start,
          children: [
            FittedBox(
              child: Padding(
                padding: EdgeInsets.only(top: 44,left: 10,right: 10,bottom: 10),
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: isMe?Colors.lightBlue:Colors.greenAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      children: [
                        Text(username,style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                        SizedBox(height: 8,),
                        Text(message_text,textAlign: TextAlign.center,),
                      ],
                    )),
              ),
            ),

          ],
        ) ,
        Positioned(
            left: isMe?null:50,
            right: isMe?50:null,
            child: CircleAvatar(backgroundImage: NetworkImage(userimage),)
        ),
      ],
    );
  }
}
