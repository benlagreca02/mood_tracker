
import 'package:flutter/material.dart';
import 'package:mood_tracking/src/emotion.dart';
import 'package:mood_tracking/src/factor.dart';
import 'package:mood_tracking/src/log_entry.dart';
import 'package:mood_tracking/src/stat.dart';

class UserModel extends ChangeNotifier {

  String name;

  // Users have their master list of emotions and factors
  // these are all of the emotions and factors they can select
  List<Emotion> emotionsSet;
  List<Factor> factorsSet;

  List<LogEntry> logEntryList;

  // the 'selected' ones that will be created into a new log entry
  Set<Emotion> pendingEmotions= {};
  Set<Factor> pendingFactors = {};

  String pendingNote = '';

  DateTime? pendingDateTime;

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
      dateTime: pendingDateTime ?? DateTime.now()
    );

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


  /// Checks to see if a stat is "pending" i.e. if it is to be put into a log entry
  bool containsPending(Stat toCheckPending){
    if(toCheckPending is Emotion){
      return pendingEmotions.contains(toCheckPending);
    }
    else if(toCheckPending is Factor){
      return pendingFactors.contains(toCheckPending);
    }
    return false;
  }

  void clearAllPending() {
    pendingEmotions = {};
    pendingFactors = {};
    pendingNote = "";
    pendingDateTime = null;
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