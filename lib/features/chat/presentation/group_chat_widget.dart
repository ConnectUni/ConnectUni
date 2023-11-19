import 'package:connectuni/features/group/presentation/group_card_view.dart';
import 'package:flutter/cupertino.dart';
import '../../group/data/group_providers.dart';
import '../../group/domain/group.dart';
import '../../group/domain/group_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'group_chat_screen.dart';

/// GroupChatWidget is a widget that displays the group chat.
/// It is a clickable widget that takes the user to the group chat page.

class GroupChatWidget extends ConsumerStatefulWidget {
  String id;

  GroupChatWidget({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<GroupChatWidget> createState() => _GroupChatWidgetState();
}

class _GroupChatWidgetState extends ConsumerState<GroupChatWidget> {
  @override
  Widget build(BuildContext context) {
    final GroupList groupsDB = ref.watch(groupsDBProvider);
    Group groupData = groupsDB.getGroupById(widget.id);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => GroupChatScreen(id: groupData.groupID)),
        );
      },
      child: GroupCardView(id: groupData.groupID),
    );
  }
}
