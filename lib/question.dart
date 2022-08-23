import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questioncontext;
  Question(this.questioncontext);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      questioncontext,
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
    );
  }
}
