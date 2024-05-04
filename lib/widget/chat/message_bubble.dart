import 'package:flutter/material.dart';
class MessageBubble extends StatelessWidget {
  final message_text;

  MessageBubble({this.message_text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text(message_text,textAlign: TextAlign.center,)),
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
