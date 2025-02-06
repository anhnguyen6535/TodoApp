import 'package:flutter/material.dart';
import 'package:todoapp/pages/housechores_page.dart';
import 'package:todoapp/pages/personal_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // List of pages navigate using bottom bar
  final List _pages = [
    PersonalPage(),
    HouseChoresPage(),
  ];

  int _currentPageIndex = 0;

  // Function handles navigation by bottom bar
  void navigateBottomBar(int index){
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.palette),
          ),
        ],
      ),

      body: _pages[_currentPageIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange[800],
        currentIndex: _currentPageIndex,
        onTap: navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal Tasks'
          ),  
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Housechores'
          ),  
        ]
      ),
    );
  }
}