import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  MessageBubble(this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).accentColor,
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
              color: Theme.of(context).textTheme.headline1!.color,
            ),
          ),
        ),
      ],
    );
  }
}
