import 'package:flutter/widgets.dart';
import 'package:mood_tracking/src/group.dart';
import 'package:mood_tracking/pages/widgets/group_member_token.dart';



// The "popup dialog" that appears when a group is tapped
// this contains all of the "tokens" that will be selected by the user
class GroupDisplayWidget<T> extends StatelessWidget {
  final Group<T> _group;

  const GroupDisplayWidget(this._group);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _group.members.map((currGroupMember) => GroupMemberToken<T>(currGroupMember)).toList(),
    );
  }
}
