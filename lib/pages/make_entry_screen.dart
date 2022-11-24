import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_tracking/pages/widgets/group_card_widget.dart';
import 'package:mood_tracking/src/user_model.dart';
import 'package:provider/provider.dart';


class MakeEntryScreen extends StatefulWidget {

  const MakeEntryScreen({Key? key}) : super(key: key);

  @override
  _MakeEntryScreenState createState() => _MakeEntryScreenState();
}

class _MakeEntryScreenState extends State<MakeEntryScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context, listen: false);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'How do you feel?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Wrap(
          children: user.emotionGroupsSet.map((currEmotionGroup) => GroupCardWidget(currEmotionGroup)).toList(),
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
            children: user.factorGroupsSet.map((currFactorGroup) => GroupCardWidget(currFactorGroup)).toList(),
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
              hintText: "Enter some notes here, this is optional"
            ),
            onChanged: (note){user.pendingNote = note;},
          )
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Text(
            'bruh moment',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          )
        )

      ],
    );
  }
}



