import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_tracking/src/log_entry.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracking/pages/widgets/log_entry_full_readout_widget.dart';


class LogEntryWidget extends StatelessWidget {

  final LogEntry _logEntry;

  LogEntryWidget(this._logEntry);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // The full readout when summary is tapped
      child: InkWell(
        onTap: (){
          showDialog(
              context: context,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 20,
                child: LogEntryFullReadout(_logEntry)
              )
          );
        },
        // The small summary card shown on the screen
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
                children: _logEntry.selectedFactors.map((e) => Text(e.toString() + ' ')).toList()
              )
            ]


          ),
        ),
      ),
    );
  }
}

//_logEntry.selectedEmotions.map((e) => Text(e.name, style: Theme.of(context).textTheme.headline5,)).toList()