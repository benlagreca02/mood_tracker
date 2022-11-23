import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_tracking/src/log_entry.dart';
import 'package:intl/intl.dart';


class LogEntryFullReadout extends StatelessWidget {

  final LogEntry _logEntry;

  LogEntryFullReadout(this._logEntry);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // On date at time you felt... text widget
            RichText(
                textAlign: TextAlign.center,
                softWrap: false,
                overflow: TextOverflow.fade,
                text: TextSpan(
                    text: 'On ',
                    style: Theme.of(context).textTheme.bodyText1,
                    children: <TextSpan>[
                      TextSpan(
                          text: DateFormat("EEE. LLL. d, yyyy").format(_logEntry.dateTime),
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary)
                      ),
                      TextSpan(
                        text: " at ",
                        style:  Theme.of(context).textTheme.bodyText1,
                      ),
                      TextSpan(
                          text: DateFormat('h:mma').format(_logEntry.dateTime),
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary)
                      ),
                      TextSpan(
                        text: " you felt...",
                        style:  Theme.of(context).textTheme.bodyText1,
                      ),
                    ]
                )
            ),

            // List of emotions
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _logEntry.selectedEmotions.fold("", (prevEmotionString, newEmotionEntry) => prevEmotionString + " " + newEmotionEntry.name),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),

            Padding(
              padding:const EdgeInsets.all(8.0),
              child: Text("Because of...", style: Theme.of(context).textTheme.subtitle1,)
            ),



            //list of factors
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                    _logEntry.selectedFactors.fold("", (prevFactorString, nextFactor) => prevFactorString + " " + nextFactor.toString())
                )
            ),

            // "Note" before the note data
            Padding(
              padding: const EdgeInsets.fromLTRB(0,8,0,0),
              child: Text("Note", style: Theme.of(context).textTheme.headline6,),
            ),


            // Note data
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(  (_logEntry.note.isEmpty) ? "No note was added" : _logEntry.note  )
            )

          ],
        )



    );
  }
}

