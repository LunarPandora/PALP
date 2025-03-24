import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'responsive_example.dart';

void main(){
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
    HomeScreen(),
    ProfileScreen(),
    ResponsiveExample()
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
            icon: Icon(Icons.person),
            label: "Profile"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_friendly),
            label: "Responsive Test"
          ),
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