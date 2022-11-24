import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_tracking/src/user_model.dart';
import 'package:provider/provider.dart';

// the small token that is selected by the user
// primarily for emotions and factors that are a part of a group

class StatToken<T> extends StatefulWidget {
  final T member;

  StatToken(this.member);

  @override
  State<StatToken> createState() => _StatTokenState();
}

class _StatTokenState extends State<StatToken> {
  late bool _isSelected;

  // Will be null on first run through before pressed
  // I *think* this is really bad but I don't know
  late Color _tokenColor;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context, listen: false);
    _isSelected = user.containsPending(widget.member);
    _tokenColor =  (_isSelected) ? Theme.of(context).colorScheme.secondary : Theme.of(context).backgroundColor;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;

            // toggle selected
            if (_isSelected) {
              user.addPending(widget.member);
            }
            else{
              user.removePending(widget.member);
            }
            // on build, assign color
            _tokenColor = (_isSelected) ? Theme.of(context).colorScheme.secondary : Theme.of(context).backgroundColor;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            // if the token hasn't been pressed, _tokenColor is null therefore set it to background color
              color: _tokenColor,
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Text(widget.member.toString()),
        ),
      ),
    );
  }
}
