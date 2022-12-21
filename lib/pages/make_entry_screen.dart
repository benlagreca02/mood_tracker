import 'package:flutter/material.dart';
import 'package:mood_tracking/src/user_model.dart';
import 'package:mood_tracking/pages/widgets/stat_token.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class MakeEntryScreen extends StatefulWidget {

  const MakeEntryScreen({Key? key}) : super(key: key);

  @override
  _MakeEntryScreenState createState() => _MakeEntryScreenState();
}

class _MakeEntryScreenState extends State<MakeEntryScreen> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context, listen: false);

    final _makeEntryFormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Make an entry"),
        actions: [
          IconButton(onPressed: user.clearAllPending, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: Form(
        key: _makeEntryFormKey,
        child: ListView(
          children: [

            // DEBUG
            // REMOVE THIS BUTTON IN THE FUTURE
            Padding(padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              child: const Text("TEST PRINT"),
              onPressed: (){
                print("-----------------------------------------------------");
                print("Emotions: ${user.pendingEmotions}");
                print("Factors:  ${user.pendingFactors}");
                print("Note:     ${user.pendingNote}");
                print("Datetime: ${user.pendingDateTime ?? "Now"}");
              },
            ),),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'How do you feel?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Wrap(
              children: user.emotionsSet.map((currEmotion) => StatToken(currEmotion)).toList(),
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
              child: Text(
                'Why do you feel this way?',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            Wrap(
                children: user.factorsSet.map((currFactor) => StatToken(currFactor)).toList(),
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center),

            Padding(
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
                child: Text(
                  'Add some notes for more detail',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                )),

            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "This is an optional field"
                ),
                onChanged: (note){
                    user.pendingNote = note;
                },
              )
            ),

            // Override Date button
            Padding(
                padding: const EdgeInsets.fromLTRB(32,0,32,32),
                child: Center(
                  child: OutlinedButton(
                    child: const Text(
                        "Change Date & Time"
                    ),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: user.pendingDateTime ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );

                      // if user just tapped out or hit cancel, just escape out of the whole sequence
                      if(pickedDate == null) {
                        return;
                      }

                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(user.pendingDateTime ?? DateTime.now())
                      );

                      if(pickedTime == null) {
                        return;
                      }

                      DateTime pickedDateTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );

                      setState(() => user.pendingDateTime = pickedDateTime);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                            Text("Date for this entry set to ${DateFormat("LLL. d, yy H:mm").format(pickedDateTime)}"))
                      );

                    },
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: Center(
                child: Card(
                  child: Text( (user.pendingDateTime == null)? "" : user.pendingDateTime.toString() ),

                ),
              ),

            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          // A confetti animation would be cute here I think
          user.addLogEntry();
          user.clearAllPending();
          Navigator.pop(context);
        },
      ),
    );
  }
}



