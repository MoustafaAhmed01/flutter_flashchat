import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class PressAndHoldButton extends StatefulWidget {
  @override
  _PressAndHoldButtonState createState() => _PressAndHoldButtonState();
}

class _PressAndHoldButtonState extends State<PressAndHoldButton> {
  bool _isPressed = false;
  /* late FlutterSoundRecorder _recorder;
  String _recordingPath = '';
  bool _isRecording = false;
  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    super.dispose();
  }
*/
/*  Future<void> _startRecording() async {
    try {
      await _recorder.openRecorder();
      await _recorder.startRecorder(
        toFile: '$_recordingPath/temp.aac',
        codec: Codec.aacADTS,
      );
      setState(() {
        _isRecording = true;
      });
      print('Recording started');
    } catch (e) {
      print('Error starting recording: $e');
    }
  }*/

  /* Future<void> _stopRecording() async {
    try {
      await _recorder.stopRecorder();
      await _recorder.closeRecorder();
      setState(() {
        _isRecording = false;
      });
      print('Recording stopped');
      // Upload the recorded audio to Firebase cloud here
    } catch (e) {
      print('Error stopping recording: $e');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
          // Perform action when button is pressed
          print('Button pressed');
          //_recordingPath = Directory.systemTemp.path;
        });
        //_startRecording();
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
          // Perform action when button is released
        });
        //_stopRecording();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
          // Perform action if button press is canceled (e.g., user moves finger away)
        });
        // _stopRecording();
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        // Change color when pressed
        child: Icon(
          Icons.mic,
          color: _isPressed ? Colors.red : Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
