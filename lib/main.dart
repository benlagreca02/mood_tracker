import 'package:flutter/material.dart';
import 'package:mood_tracking/pages/home_screen.dart';
import 'package:mood_tracking/pages/make_entry_screen.dart';
import 'package:mood_tracking/src/emotion.dart';
import 'package:mood_tracking/src/factor.dart';
import 'package:mood_tracking/src/log_entry.dart';
import 'package:provider/provider.dart';
import 'src/user_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // This is just dummy data, in the future, this will be pulled from some webserver that I make
      // The server will hold all user's data and their relations
      create: (context) =>
      UserModel(
        name: "Brian May",

        emotionsSet: [
          Emotion(name: "Happy", color: Colors.orange),
          Emotion(name: "Sad"),
          Emotion(name: "Anxious"),
          Emotion(name: "Angry"),
          Emotion(name: "Numb"),
          Emotion(name: "Excited"),
          Emotion(name: "Stressed"),
          Emotion(name: "Loving"),
          Emotion(name: "Passionate"),
        ],
        factorsSet: [
          Factor(name: "School"),
          Factor(name: "Work"),
          Factor(name: "Social life"),
          Factor(name: "Health"),
          Factor(name: "Money"),
          Factor(name: "Holidays"),
        ],

        logEntryList:
        [
          LogEntry(
            selectedFactors: {Factor(name: "Accomplished Goals"), Factor(name: "School")},
            selectedEmotions: {Emotion(name: "Proud"), Emotion(name: "Excited")},
            note: "Just finished a big project!",
            dateTime: DateTime.utc(2002, 2,8),
          ),
          LogEntry(
            selectedFactors: {Factor(name: "School")},
            selectedEmotions: {Emotion(name: "Depressed", color: Colors.lightBlue), Emotion(name: "Hopeless")},
            note: "Got a really bad grade on that project",
            dateTime: DateTime.utc(2002, 10,2),
          ),
          LogEntry(
            selectedFactors: {Factor(name: "The Mrs.")},
            selectedEmotions: {Emotion(name: "Happy")},
            dateTime: DateTime.utc(2022,11,17),
          )
        ],
      ),
      child:  const MyApp()
    )
  );
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/homeScreen',
      routes: {
        '/homeScreen': (context) => const HomeScreen(),
        // In the future, I may change the make entry screen to a popup? For now it works fine though
        '/makeEntryScreen': (context) => const MakeEntryScreen(),
      }
    );
  }
}



