import 'package:flutter/material.dart';
import 'package:mood_tracking/pages/log_entry_widget.dart';
import 'package:mood_tracking/src/user_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<UserModel>(
        builder:(context, user, child) => ListView(
          children: user.logEntryList.map((e) => LogEntryWidget(e)).toList()
        ),
      ),
    );
  }
}
