import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



 /* int _selectedIndex = 0;*/

  /*List<Widget> screens = [
    const Text('HOME'),
    const Text('PROFILE'),
    const Text('SEARCH'),
    const Text('SETTING'),
  ];
*/

  List<Widget> list = [

    const Text('HOME'),
    const Text('PERSON'),
    const Text('SEARCH'),
    const Text('SETTING'),
    const Text('MAN'),

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 5, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Facebook'),
        bottom: const TabBar(
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.red,
          labelColor: Colors.blue,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: 'HOME',
            ),

            Tab(
              icon: Icon(Icons.person),
              text: 'PERSON',
            ),

            Tab(
              icon: Icon(Icons.search),
              text: 'SEARCH',
            ),

            Tab(
              icon: Icon(Icons.settings),
              text: 'SETTING',
            ),

            Tab(
              icon: Icon(Icons.face),
              text: 'FACE',
            ),
          ],
          
        ),

      ),

      body: const TabBarView(
        children: [
              Center(child: Text('HOME')),
              Center(child: Text('PERSON')),
              Center(child: Text('SEARCH')),
              Center(child: Text('SETTING')),
              Center(child: Text('FACE')),
            ],
          ),

      ),

    );

  }
}