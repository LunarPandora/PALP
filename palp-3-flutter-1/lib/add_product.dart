import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

// import 'package:intl/intl.dart';
// import 'package:http/http.dart' as http;

class AddProductScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Latihan StatefulWidget",
      home: ProductAddScreen()
    );
  }
}

class ProductAddScreen extends StatefulWidget {
  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen>{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('product');

    void addDataToBox() {
      int len = box.length;

      box.put(len, {
        'id': 0,
        'name': _nameController.text,
        'price': int.parse(_priceController.text),
        'photo': _photoController.text,
        'is_promo': 0
      });
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: "Nama menu",
              border: OutlineInputBorder()
            ) 
          ),
          SizedBox(height: 30),
          TextField(
            controller: _priceController,
            decoration: InputDecoration(
              labelText: "Harga menu",
              border: OutlineInputBorder()
            ) 
          ),
          SizedBox(height: 30),
          TextField(
            controller: _photoController,
            decoration: InputDecoration(
              labelText: "Link foto menu",
              border: OutlineInputBorder()
            ) 
          ),
          SizedBox(height: 30),
           ElevatedButton(
            onPressed: addDataToBox,
            child: Text('Submit'),
          ),
        ],
      ),
    );    
  }
}