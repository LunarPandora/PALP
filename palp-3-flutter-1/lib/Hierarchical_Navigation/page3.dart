import "package:flutter/material.dart";

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman ketiga"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Halaman ketiga (Detail)",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Kembali ke halaman sebelumnya")
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("Kembali ke halaman awal")
            ),
          ],
        )
      )
    );   
  }
}