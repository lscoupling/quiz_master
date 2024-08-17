import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  String? _correctAnswer;
  bool _isAnswered = false; // 用來標記是否已經作答

  // 範例問題
  final List<Map<String, Object>> _questions = [
    {
      'questionText':
          'A Solution Architect works for an insurance company that has a large number of patient health records. Each record will be used once when assessing a patient and will need to be securely stored for seven years...',
      'options': [
        'Amazon S3 Reduced Redundancy Storage',
        'Amazon S3',
        'Amazon Glacier',
        'Amazon S3 Infrequent Access'
      ],
      'correctAnswer': 'Amazon Glacier',
    },
  ];

  void _onAnswerSelected(String? answer) {
    if (_isAnswered) return; // 如果已經回答則不允許更改答案
    setState(() {
      _selectedAnswer = answer;
    });
  }

  void _onSubmit() {
    if (_selectedAnswer != null) {
      setState(() {
        _isAnswered = true;
        _correctAnswer = _questions[_currentQuestionIndex]['correctAnswer'] as String?;
      });
    }
  }

  Widget _buildOption(String option) {
    bool isCorrect = option == _correctAnswer;
    bool isSelected = option == _selectedAnswer;

    Color bgColor;
    if (_isAnswered) {
      if (isCorrect) {
        bgColor = Colors.green[100]!;
      } else if (isSelected) {
        bgColor = Colors.red[100]!;
      } else {
        bgColor = Colors.white;
      }
    } else {
      bgColor = Colors.white;
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: bgColor,
        elevation: isSelected ? 4 : 0, // 增加選中選項的陰影效果
        shadowColor: isSelected ? Colors.blueAccent : Colors.transparent,
        child: ListTile(
          title: Text(option),
          leading: _isAnswered
              ? (isCorrect
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : isSelected
                      ? Icon(Icons.cancel, color: Colors.red)
                      : null)
              : null,
          onTap: () => _onAnswerSelected(option),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('【題庫】SAA 解決方案架構師'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '問題 ${_currentQuestionIndex + 1}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              _questions[_currentQuestionIndex]['questionText'] as String,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            ...(_questions[_currentQuestionIndex]['options'] as List<String>).map((option) {
              return _buildOption(option);
            }).toList(),
            if (_isAnswered)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedAnswer == _correctAnswer
                          ? '您答對了！'
                          : '您答錯了！ 正確答案為 ${_correctAnswer!}。',
                      style: TextStyle(
                        fontSize: 16,
                        color: _selectedAnswer == _correctAnswer ? Colors.green : Colors.red,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '觀看詳解',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentQuestionIndex > 0
                      ? () {
                          setState(() {
                            _currentQuestionIndex--;
                            _selectedAnswer = null; // 重置選擇
                            _isAnswered = false; // 重置回答狀態
                          });
                        }
                      : null,
                  child: Text('上一題'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                ElevatedButton(
                  onPressed: _isAnswered ? null : _onSubmit,
                  child: Text('答案送出'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
                ElevatedButton(
                  onPressed: _currentQuestionIndex < _questions.length - 1
                      ? () {
                          setState(() {
                            _currentQuestionIndex++;
                            _selectedAnswer = null; // 重置選擇
                            _isAnswered = false; // 重置回答狀態
                          });
                        }
                      : null,
                  child: Text('下一題'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
