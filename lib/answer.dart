import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback a;
  final String answer;

  Answer(this.a,this.answer);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(onPrimary: Colors.blue),
        onPressed: a,
        child: Text(
         answer,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
