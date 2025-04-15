import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_1/fetch_product.dart';
import 'package:flutter_1/add_product.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('product');

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Latihan StatefulWidget",
      home: MainScreen()
    );
  }
}

class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  int _currentIndex = 0;

  final List<Widget> _screens = [
    FetchProductScreen(),
    AddProductScreen(),
    // ResponsiveExample()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_check_outlined),
            label: "New Product"
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.mobile_friendly),
          //   label: "Responsive Test"
          // ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        }
      ),
    );
  }
}