import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final VoidCallback onPressed;
  final bool isSelected;

  AnswerButton({
    required this.answerText,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blueAccent : Colors.blue,
      ),
      onPressed: onPressed,
      child: Text(answerText, style: TextStyle(color: Colors.white)),
    );
  }
}
