import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _SecondScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    const Text('HOME'),
    const Text('PROFILE'),
    const Text('SEARCH'),
    const Text('SETTING'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: const Text("Name"),
        ),

        body: Center(
          child: screens[_selectedIndex],
        ),

      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      backgroundColor: Colors.amberAccent,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.shifting,
      iconSize: 40,

      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle: const TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      onTap: (index) {
        print(index);
        _selectedIndex = index;

        setState(() {});
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Setting'),
      ],
    ),

    );
  }
}

class _SecondScreen extends StatefulWidget {
  @override
  State<_SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<_SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(



    );
  }
}

