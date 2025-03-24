import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.purple[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://images.pexels.com/photos/19970832/pexels-photo-19970832/free-photo-of-portrait-of-a-gray-and-white-cat.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
              width: 150,
              height: 150
            ),
            SizedBox(height: 20),
            const Text(
              "This is a home screen",
              style: TextStyle(
                fontSize: 20
              ),
            )
          ],
        )
      )
    );
  }
}