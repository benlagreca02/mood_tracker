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
      child: InkWell(
        onTap: (){
          showDialog(
              context: context,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 16,
                child: LogEntryFullReadout(_logEntry)
              )
          );
        },
        // The summary card shown on the screen
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(

                children: [
                  Expanded(child: Text(_logEntry.selectedEmotions.first.name, style: Theme.of(context).textTheme.headline5)),
                  Text(DateFormat('E. LLL. d yyyy').format(_logEntry.dateTime))
                ],
              ),
              Row(
                children: _logEntry.selectedFactors.map((e) => Text(e + ' ')).toList()
              )
            ]


          ),
        ),
      ),
    );
  }
}



class LogEntryFullReadout extends StatelessWidget {

  final LogEntry _logEntry;

  LogEntryFullReadout(this._logEntry);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        height: 200,
        child: Column(
          children: [
            // DateTime at top of readout
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(DateFormat("EEE. LLL. d, yyyy h:mma").format(_logEntry.dateTime)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_logEntry.note)
            )

          ],
        ),
      )



    );
  }
}



//_logEntry.selectedEmotions.map((e) => Text(e.name, style: Theme.of(context).textTheme.headline5,)).toList()