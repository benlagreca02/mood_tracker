
// The big card that is shown per group
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_tracking/pages/widgets/group_display_widget.dart';
import 'package:mood_tracking/src/group.dart';
import 'package:mood_tracking/src/stat.dart';
import 'package:mood_tracking/src/user_model.dart';
import 'package:provider/provider.dart';

class GroupCardWidget<T> extends StatelessWidget {
  final Group<T> group;

  const GroupCardWidget(this.group);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context, listen: true);
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 16,
                child: GroupDisplayWidget<T>(group)));
      },
      child: Container(
        width: 175,
        height: 175,
        // internal padding
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).backgroundColor,
        ),

        child: Column(
          children:
            [Text(group.name, textAlign: TextAlign.center)] +
            user.getPendingOfType(T).intersection(group.members).map((e) => Text(e.name)).toList()
        ),
      ),
    );
  }
}
