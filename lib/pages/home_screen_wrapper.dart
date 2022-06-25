

import 'package:flutter/material.dart';
import 'package:mood_tracking/pages/home_screen.dart';
import 'package:mood_tracking/pages/make_entry_screen.dart';
import 'package:mood_tracking/src/user_model.dart';
import 'package:provider/provider.dart';

import 'edit_screen.dart';

class HomeScreenWrapper extends StatefulWidget {
  @override
  State<HomeScreenWrapper> createState() => _HomeScreenWrapperState();
}

class _HomeScreenWrapperState extends State<HomeScreenWrapper> {

  int _bottomNavBarIndex = 1;

  static final List<Widget> _frontPageOptions = <Widget>[
    EditScreen(),
    HomeScreen(),
    MakeEntryScreen()
  ];

  static final List<Widget> _titleOptions = <Widget>[
    Text("Edit Groupings"),
    Text("Your Past Logs"),
    Text("Make a Log Entry"),
  ];

  // is there a more "sound" way to do this, or is empty containers ok?
  static final List<Widget> _actionOptions = <Widget> [
    Container(),
    Container(),
    Consumer<UserModel>(
      builder: (context, user, child) {
        return IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            user.clearAllPending();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Current Pending Entry Deleted"),)
            );
          },
        );
      }
    )
  ];


  void _onBottomNavBarItemTapped(int index){
    setState( () {
      _bottomNavBarIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: _frontPageOptions.elementAt(_bottomNavBarIndex),
      ),




      appBar: AppBar(
        title: _titleOptions.elementAt(_bottomNavBarIndex),
        actions: [_actionOptions.elementAt(_bottomNavBarIndex)],
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

