
import 'package:flutter/material.dart';
import 'package:mood_tracking/src/emotion.dart';
import 'package:mood_tracking/src/factor.dart';
import 'package:mood_tracking/src/log_entry.dart';
import 'package:mood_tracking/src/stat.dart';

class UserModel extends ChangeNotifier {

  String name;

  // Users have their master list of emotions and factor,
  List<Emotion> emotionsSet;
  List<Factor> factorsSet;

  List<LogEntry> logEntryList; // sorted by date hopefully?

  // the 'selected' ones that will be created into a new log entry
  Set<Emotion> pendingEmotions= {};
  Set<Factor> pendingFactors = {};

  Set<Stat> getAllPending(){
    return (pendingEmotions as Set<Stat>).union(pendingFactors as Set<Stat>);
  }
  
  String pendingNote = '';

  // this will somehow get changed to fetch from a server based on username and pw?
  // no idea yet...
  UserModel(
      {required this.name, required this.emotionsSet, required this.factorsSet,
        required this.logEntryList});


  void addLogEntry(){
    LogEntry lg = LogEntry(
      selectedFactors: pendingFactors,
      selectedEmotions: pendingEmotions,
      note: pendingNote,
      dateTime: DateTime.now());

    logEntryList.add(lg);

    notifyListeners();
  }

  void removeLogEntry(LogEntry toRemove) {
    logEntryList.remove(toRemove);
    notifyListeners();
  }


  void addPending(dynamic toAddToPending){
    if(toAddToPending is Emotion){
      pendingEmotions.add(toAddToPending);
    }
    else if(toAddToPending is Factor){
      pendingFactors.add(toAddToPending);
    }
    else{
      throw Exception("You're trying to add some pending thing of a bad type! This should NEVER happen");
    }
    notifyListeners();
  }

  void removePending(dynamic toTakeFromPending){
    if(toTakeFromPending is Emotion){
      pendingEmotions.remove(toTakeFromPending);
    }
    else if(toTakeFromPending is Factor){
      pendingFactors.remove(toTakeFromPending);
    }
    else{
      throw Exception("You're trying to remove some pending thing of a bad type! This should NEVER happen");
    }
    notifyListeners();
  }


  bool containsPending(dynamic toCheckPending){
    if(toCheckPending is Emotion){
      return pendingEmotions.contains(toCheckPending);
    }
    else if(toCheckPending is Factor){
      return pendingFactors.contains(toCheckPending);
    }
    else{
      print("Types didn't match in check! returning false...");
      return false;
    }
  }

  void clearAllPending() {
    pendingEmotions = {};
    pendingFactors = {};
    pendingNote = "";
    notifyListeners();
  }

  Set getPendingOfType(Type t) {
    switch (t) {
      case Emotion:
        return pendingEmotions;
      case Factor:
        return pendingFactors;
    }
    return <dynamic>{};  // to avoid returning nothing
  }



}