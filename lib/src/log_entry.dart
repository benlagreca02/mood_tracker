


import 'package:mood_tracking/src/emotion.dart';

/// Will be generated in a form that the user fills out and added to the user's
class LogEntry {
  // may want to change this datatype later
  final Set<String> selectedFactors;
  final Set<Emotion> selectedEmotions;
  final String note;
  final DateTime dateTime;

  LogEntry({required this.selectedFactors, required this.selectedEmotions,
    this.note='', required this.dateTime});
}
