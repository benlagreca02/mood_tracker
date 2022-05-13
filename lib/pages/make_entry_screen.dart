import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_tracking/src/group.dart';
import 'package:mood_tracking/src/user_model.dart';
import 'package:provider/provider.dart';

class MakeEntryScreen extends StatefulWidget {
  const MakeEntryScreen({Key? key}) : super(key: key);

  @override
  _MakeEntryScreenState createState() => _MakeEntryScreenState();
}

class _MakeEntryScreenState extends State<MakeEntryScreen> {
  @override
  Widget build(BuildContext context) =>
      Consumer<UserModel>(builder: (context, user, child) {
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
              children:
                  user.emotionGroupsSet.map((e) => GroupWidget(e)).toList(),
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Why do you feel this way?',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            Wrap(
                children:
                    user.factorGroupsSet.map((e) => GroupWidget(e)).toList(),
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Add some additional notes for more detail',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ))
          ],
        );
      });
}

class GroupWidget extends StatelessWidget {
  final Group _group;

  const GroupWidget(this._group, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 16,
                child: GroupDisplayWidget(_group)));
      },
      child: Container(
        width: 175,
        height: 175,
        // internal padding
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),

        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).backgroundColor,
        ),
        child: Text(_group.name, textAlign: TextAlign.center),
      ),
    );
  }
}

class GroupDisplayWidget extends StatelessWidget {
  final Group _group;

  GroupDisplayWidget(this._group);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Theme.of(context).backgroundColor,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _group.members.map((e) => GroupMemberToken(e)).toList(),
      ),
    );
  }
}

class GroupMemberToken extends StatefulWidget {
  final member;

  const GroupMemberToken(this.member, {Key? key}) : super(key: key);

  @override
  State<GroupMemberToken> createState() => _GroupMemberTokenState();
}

class _GroupMemberTokenState extends State<GroupMemberToken> {

  bool _isSelected = false;

  // Will be null on first run through before pressed
  // I *think* this is really bad but I don't know
  Color? _tokenColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: (){
          _isSelected = !_isSelected;
          // DEBUG print msg
          print(_isSelected.toString() + " " + widget.member.toString());
          setState((){
            _tokenColor = (_isSelected) ? Theme.of(context).colorScheme.secondary : Theme.of(context).backgroundColor;

          });
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              // if the token hasn't been pressed, _tokenColor is null therefore set it to background color
              color: (_tokenColor == null)? Theme.of(context).backgroundColor : _tokenColor,
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Text(widget.member.toString()),
        ),
      ),
    );
  }
}
