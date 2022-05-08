import 'package:flutter/material.dart';
import 'package:mood_tracking/src/log_entry.dart';
import 'package:intl/intl.dart';


class LogEntryWidget extends StatelessWidget {

  final LogEntry _logEntry;

  LogEntryWidget(this._logEntry);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Theme.of(context).cardColor,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(

              children: [
                Expanded(child: Text(_logEntry.selectedEmotions.first.name, style: Theme.of(context).textTheme.headline6)),
                Text(DateFormat('E. LLL. dd yyyy').format(_logEntry.dateTime))
              ],
            ),
            Row(
              children: _logEntry.selectedFactors.map((e) => Text(e)).toList()
            )
          ]


        ),
      ),
    );
  }
}

//_logEntry.selectedEmotions.map((e) => Text(e.name, style: Theme.of(context).textTheme.headline5,)).toList()