import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/saa_page.dart';
import 'screens/quiz_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizMaster',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // 設定主頁為 HomePage
      routes: {
        '/saa': (context) => SAAPage(),  // 定義導航至 SAA 題庫頁面的路由
        '/quiz': (context) => QuizPage(), // 定義導航至 QuizPage 題目的路由
      },
      debugShowCheckedModeBanner: false, // 隱藏 Debug 標籤
    );
  }
}
