import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Flat_Navigation/flat_main.dart';
import '../Hierarchical_Navigation/hierarchical_main.dart';
import '../Hub_Spoke_Navigation/hub_main.dart';
import '../Modal_Navigation/modal_main.dart';
import '../Sequential_Navigation/seq_main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produk API Demo',
      home: const ProductListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List products = [];
  bool isLoading = true;

  final String apiUrl = 'http://127.0.0.1:8000/api/products';

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          products = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Gagal memuat data');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: Icon(Icons.menu, color: Colors.black),
        // actions: [Icon(Icons.shopping_bag_outlined, color: Colors.black), SizedBox(width: 16)],
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTaskLists()
            ],
          ),
        ),
      )
    );
  }

  Widget _buildTaskLists() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          _buildTaskCard('Kerja tugas', '15-09-2023', Colors.blue.shade400)
        ]
      ),
    );
  }

  Widget _buildTaskTag(Color tagColor, Color tagTextColor, String tagName){
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
        color: tagColor
      ),
      child: Column(
        children: [
          Text(
            tagName,
            style: TextStyle(
              color: tagTextColor
            ),
          )
        ]
      )
    );
  }

  Widget _buildTaskCard(String taskName, String date, Color cardColor){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 45, 20, 45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cardColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            taskName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildTaskTag(Colors.white, Colors.blue, 'Work'),
              SizedBox(width: 10),
              Text(
                date,
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _enableNavigationExample(){
    return Column(children: [
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FlatNavApp()),
          );
        },
        child: Text('Flat Navigation'),
      ),
      SizedBox(height: 10),
      
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HierarchicalNavApp()),
          );
        },
        child: Text('Hierarchical Navigation'),
      ),
      SizedBox(height: 10),
      
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HubSpokeNavApp()),
          );
        },
        child: Text('Hub - Spoke Navigation'),
      ),
      SizedBox(height: 10),
      
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ModalNavApp()),
          );
        },
        child: Text('Modal Navigation'),
      ),
      SizedBox(height: 10),
      
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SeqNavApp()),
          );
        },
        child: Text('Sequential Navigation'),
      ),
    ]);
  }
}
