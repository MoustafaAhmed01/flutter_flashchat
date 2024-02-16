import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'message_bubble.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream(this.fireBaseVar, this.SignedInUser);
  final FirebaseFirestore fireBaseVar;
  final User? SignedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fireBaseVar
          .collection('messages')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        }
        final messages = snapshot.data!.docs;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data()['text'];
          final messageSender = message.data()['sender'];
          final currentUser = SignedInUser?.email;

          final messageBubble = MessageBubble(
              messageSender, messageText, currentUser == messageSender);

          // Fix: Use add method to add to the list
          messageBubbles.add(messageBubble);
        }
        // Return the list of Text widgets
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

/**/
