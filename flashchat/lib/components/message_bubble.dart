import 'dart:async';

import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.sender, this.text, this.isMe);
  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
          Stack(
            children: [
              GestureDetector(
                onLongPress: () {
                  // Do something when long press is detected
                  kTextElevation = 0;
                  print('Long press detected!');
                },
                onLongPressEnd: (details) {
                  kTextElevation = 5;
                  // Cancel the timer if the long press is released before the duration elapses
                  print('Long press released!');
                },
                child: Material(
                  /* el 7rka de 3shan tbyn men l byb3t l notch l fo2 de  */
                  borderRadius: isMe
                      ? BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))
                      : BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                  elevation: kTextElevation,
                  color: isMe ? Colors.lightBlueAccent : Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      '$text',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
