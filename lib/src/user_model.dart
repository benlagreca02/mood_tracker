
import 'package:flutter/material.dart';
import 'package:mood_tracking/src/emotion.dart';
import 'package:mood_tracking/src/group.dart';
import 'package:mood_tracking/src/log_entry.dart';

class UserModel extends ChangeNotifier {

  // Users have their master list of emotion groups and factor groups, which each contain emotions and factors
  String name;
  Set<Group<Emotion>> emotionGroupsSet;
  Set<Group<String>> factorGroupsSet;
  List<LogEntry> logEntryList; // sorted by date hopefully

  UserModel({required this.name, required this.emotionGroupsSet, required this.factorGroupsSet,
      required this.logEntryList});





  void addLogEntry(LogEntry newEntry){
    logEntryList.add(newEntry);
    notifyListeners();
  }

  void removeLogEntry(LogEntry toRemove){
    logEntryList.remove(toRemove);
    notifyListeners();
  }

  void addEmotionGroup(Group<Emotion> newEmotionGroup){
    emotionGroupsSet.add(newEmotionGroup);
    notifyListeners();
  }

  void addFactorGroup(Group<String> newFactorGroup){
    factorGroupsSet.add(newFactorGroup);
    notifyListeners();
  }

}