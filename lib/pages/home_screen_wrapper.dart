

import 'package:flutter/material.dart';
import 'package:mood_tracking/pages/home_screen.dart';
import 'package:mood_tracking/pages/make_entry_screen.dart';

import 'edit_screen.dart';

class HomeScreenWrapper extends StatefulWidget {
  @override
  State<HomeScreenWrapper> createState() => _HomeScreenWrapperState();
}

class _HomeScreenWrapperState extends State<HomeScreenWrapper> {

  int _bottomNavBarIndex = 1;

  void _onBottomNavBarItemTapped(int index){
    setState( () {
      _bottomNavBarIndex = index;
    });
  }

  static final List<Widget> _frontPageOptions = <Widget>[
    EditScreen(),
    HomeScreen(),
    MakeEntryScreen()
  ];

  static final List<String> _titleOptions = <String>[
    "Edit Groupings",
    "Your Past Logs",
    "Make a Log Entry"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: _frontPageOptions.elementAt(_bottomNavBarIndex),
      ),




      appBar: AppBar(
        title: Text(_titleOptions[_bottomNavBarIndex]),
        centerTitle: true,
      ),




      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Edit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Make Entry',
          ),
        ],
        currentIndex: _bottomNavBarIndex,
        onTap: _onBottomNavBarItemTapped,

      ),
    );
  }
}

