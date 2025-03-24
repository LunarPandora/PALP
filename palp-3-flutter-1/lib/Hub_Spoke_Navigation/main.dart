import 'package:flutter/material.dart';
import 'spoke_first_page.dart';
import 'spoke_second_page.dart';
import 'spoke_third_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hub and Spoke Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HubPage(),
    );
  }
}

class HubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hub Page - Main Menu')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hub - Halaman Utama', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpokeFirstPage()),
                );
              },
              child: Text('Pergi ke Fitur 1'),
            ),
            SizedBox(height: 10),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpokeSecondPage()),
                );
              },
              child: Text('Pergi ke Fitur 2'),
            ),
            SizedBox(height: 10),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpokeThirdPage()),
                );
              },
              child: Text('Pergi ke Fitur 3'),
            ),
          ],
        ),
      ),
    );
  }
}
