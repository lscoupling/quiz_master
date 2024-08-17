import 'package:flutter/material.dart';
import 'quiz_page.dart';

class SAAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/your_logo.jpg', height: 40),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 讓標題左對齊
          children: [
            Row(
              children: [
                Image.asset('assets/images/aws_saa.jpg', height: 120),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SAA 解決方案架構師',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('答對題數: 0', style: TextStyle(fontSize: 16)),
                    Text('總答題數: 0', style: TextStyle(fontSize: 16)),
                    Text('答對率: 尚未答題', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()), // 導航至測驗頁面
                );
              },
              child: Text('開始答題'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首頁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: '題庫',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '會員',
          ),
        ],
        currentIndex: 1, // 預設選中題庫
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
