import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String text;

  QuestionText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
