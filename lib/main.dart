import 'package:flutter/material.dart';
import 'package:mood_tracking/src/emotion.dart';
import 'package:mood_tracking/src/factor.dart';
import 'package:mood_tracking/src/log_entry.dart';
import 'package:provider/provider.dart';
import 'src/user_model.dart';
import 'pages/home_screen_wrapper.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // dummy data, really not that epic
      create: (context) =>
      UserModel(
        name: "Brian May",

        emotionsSet: [
          Emotion("Happy"),
          Emotion("Sad"),
          Emotion("Anxious"),
          Emotion("Angy"),
          Emotion("numb"),
          Emotion("excited"),
          Emotion("stressed"),
          Emotion("loving"),
          Emotion("passionate"),
        ],
        factorsSet: [
          Factor("skoo"),
          Factor("Work"),
          Factor("Social life"),
          Factor("health")
        ],

        logEntryList:
        [
          LogEntry(
            selectedFactors: {Factor("factor1"), Factor("factor2")},
            selectedEmotions: {Emotion("Emotion1"), Emotion("Emotion2")},
            note: "this is a note on the first entry!",
            dateTime: DateTime.utc(2002, 2,8),
          ),
          LogEntry(
            selectedFactors: {Factor("factor3"), Factor("factor4")},
            selectedEmotions: {Emotion("Emotion3"), Emotion("Emotion4")},
            note: "this is a note on the second entry!",
            dateTime: DateTime.utc(2002, 10,2),
          ),
          LogEntry(
            selectedFactors: {Factor("factor5"), Factor("factor6")},
            selectedEmotions: {Emotion("Emotion5"), Emotion("Emotion6")},
            dateTime: DateTime.utc(2016,3,16),
          )
        ],
      ),
      child:  MyApp()
    )
  );
}



class MyApp extends StatefulWidget {
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
        '/homeScreen': (context) => HomeScreenWrapper(),
      }
    );
  }
}



