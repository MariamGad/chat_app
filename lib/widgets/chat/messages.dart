import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (ctx, AsyncSnapshot<dynamic> snapshot) {
        final user = FirebaseAuth.instance.currentUser;
        if (snapshot.connectionState == ConnectionState.waiting ||
            user == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final chatDocs = snapshot.data.docs;
        return ListView.builder(
          reverse: true,
          itemBuilder: (ctx, index) {
            return MessageBubble(
              chatDocs[index]['text'],
              chatDocs[index]['userId'] == user.uid,
              chatDocs[index]['username'],
              chatDocs[index]['userImage'],
              key: ValueKey(chatDocs[index]),
            );
          },
          itemCount: chatDocs.length,
        );
      },
    );
  }
}
