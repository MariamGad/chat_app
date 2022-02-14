import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.isMe, {required this.key});
  final String message;
  final bool isMe;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: isMe ? Radius.circular(15) : Radius.circular(0),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(15),
            ),
            color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isMe
                  ? Colors.black
                  : Theme.of(context).textTheme.headline1!.color,
            ),
          ),
        ),
      ],
    );
  }
}
