import 'package:flutter/material.dart';
import 'package:mood_tracking/src/emotion.dart';
import 'package:mood_tracking/src/group.dart';
import 'package:mood_tracking/src/log_entry.dart';
import 'package:provider/provider.dart';
import 'src/user_model.dart';
import 'pages/home_screen_wrapper.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // dummy data, really not that epic
      create: (context) => UserModel(
        name: "Brian May",

        emotionGroupsSet: {
          Group<Emotion>(
            name: "EmotionGroup1",
            icon: const Icon(Icons.adb),
            members: {Emotion("Emotion1", -1)}
          ),
        },
        factorGroupsSet: {
          Group<String>(
            name: "FactorGroup1",
            icon: const Icon(Icons.school),
            members: {"Factor1", "Factor2", "Factor3"}
          )
        },

        logEntryList:
        [
          LogEntry(
            selectedFactors: {"factor1", "factor2"},
            selectedEmotions: {Emotion("Emotion1", 1), Emotion("Emotion2", 2)},
            note: "this is a note on the first entry!",
            dateTime: DateTime.utc(2002, 2,8),
          ),

         LogEntry(
           selectedFactors: {"factor3", "factor4"},
           selectedEmotions: {Emotion("Emotion3", 4), Emotion("Emotion4", 4)},
           note: "this is a note on the second entry!",
           dateTime: DateTime.utc(2002, 10,2),
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



