class Question {
  final String questionText;
  final List<String> answers;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswer,
  });

  bool isCorrect(String selectedAnswer) {
    return selectedAnswer == correctAnswer;
  }
}
