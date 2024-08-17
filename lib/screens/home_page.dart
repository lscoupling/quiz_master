import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AWS 雲端認證',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCertificationCard(
                    context, 'assets/images/aws_clf.jpg', 'CLF', '雲端從業人員'),
                _buildCertificationCard(
                    context, 'assets/images/aws_saa.jpg', 'SAA', '解決方案架構師', '/saa'), // 導航到 SAA 頁面
                _buildCertificationCard(
                    context, 'assets/images/aws_soa.jpg', 'SOA', '雲端維運人員'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'GCP 雲端認證',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCertificationCard(
                    context, 'assets/images/gcp_ace.jpg', 'ACE', '雲端工程師'),
                _buildCertificationCard(
                    context, 'assets/images/gcp_cdl.jpg', 'CDL', '雲端數位領導'),
              ],
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
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildCertificationCard(BuildContext context, String imagePath,
      String title, String subtitle, [String? route]) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.pushNamed(context, route); // 導航至指定路由
        }
      },
      child: Column(
        children: [
          Image.asset(imagePath, height: 80),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(subtitle, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
