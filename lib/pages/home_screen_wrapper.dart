

import 'package:flutter/material.dart';
import 'package:mood_tracking/pages/home_screen.dart';

import 'manage_screen.dart';

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
    ManageScreen(),
    HomeScreen(),
    const Text('why are you here')
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: _frontPageOptions.elementAt(_bottomNavBarIndex),
      ),




      appBar: AppBar(
        title: const Text("Mood Tracker"),
        centerTitle: true,
      ),





      floatingActionButton: FloatingActionButton(
        onPressed: () { print("Wowaza!");},
        child: const Icon(Icons.add)
      ),




      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airline_seat_flat_angled_rounded),
            label: 'filla',
          ),
        ],
        currentIndex: _bottomNavBarIndex,
        onTap: _onBottomNavBarItemTapped,

      ),
    );
  }
}

