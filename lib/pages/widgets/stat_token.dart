import 'package:flutter/material.dart';
import 'package:mood_tracking/src/user_model.dart';
import 'package:provider/provider.dart';

// the small token that is selected by the user
// primarily for emotions and factors

class StatToken<Stat> extends StatefulWidget {
  final Stat member;

  const StatToken(this.member);

  @override
  State<StatToken> createState() => _StatTokenState();
}

class _StatTokenState extends State<StatToken> {
  late bool _isSelected;
  late Color _tokenColor;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context, listen: true);
    _isSelected = user.containsPending(widget.member);

    Color fgColor = widget.member.color?[700] ?? Theme.of(context).colorScheme.secondary;
    Color bgColor = widget.member.color?[100] ?? Theme.of(context).backgroundColor;
    // prepare variable for when the widget is first built
    _tokenColor = (_isSelected) ? fgColor : bgColor;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
            // toggle selected
            if (_isSelected){
              user.addPending(widget.member);
            }
            else{
              user.removePending(widget.member);
            }

            // on build, assign color
            _tokenColor = (_isSelected) ? fgColor : bgColor;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          width: 120,
          decoration: BoxDecoration(
              color: _tokenColor,
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Text(widget.member.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),  // this will probably change eventually when I do a UI 'prettiness' overhaul

          ),
        ),
      ),
    );
  }
}
