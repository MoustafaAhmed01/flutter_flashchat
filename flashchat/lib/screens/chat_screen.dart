import 'package:flutter/material.dart';
import 'package:flashchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/alerts.dart';
import 'package:flashchat/components/recording.dart';
import '../components/messsage_stream.dart';

/*-------------------------------------------------*/
/* Global varibels */
final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
late User? loggedInUser = _auth.currentUser;

/*-------------------------------------------------*/
class ChatScreen extends StatefulWidget {
  /* Identifying the screen */
  static String id = 'Screen_Chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  /* da 3shan n control 2nna nms7 msln l text b3d mt3ml send */
  final messageTextControlle = TextEditingController();
  late String messageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                //Implement logout functionality
                _auth.signOut();
                //  toastFun('Signed Out!');
                //  Navigator.pop(context);

                /* Delete from the data base */
/*                DocumentReference messageRef = FirebaseFirestore.instance
                    .collection('messages')
                    .doc('rdPFv9wk1rk5sj3dHmor');
                await messageRef.delete();*/
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(_firestore, loggedInUser),
            Container(
              decoration: kMessageContainerDecoration,
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextControlle,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PressAndHoldButton(),
                      TextButton(
                        onPressed: () {
                          //getMessages();
                          messageTextControlle.clear();
                          // Implement send functionality.
                          _firestore.collection('messages').add({
                            'text': messageText,
                            'sender': loggedInUser?.email,
                            'createdAt': FieldValue.serverTimestamp()
                          });
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.red), // Change the text color
                        ),
                        child: Text(
                          'Send',
                          style: kSendButtonTextStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
