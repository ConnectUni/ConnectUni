import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectuni/features/group/domain/group.dart';
import '../data/group_providers.dart';
import '../domain/group_list.dart';

class GroupCardView extends ConsumerWidget {
  const GroupCardView({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GroupList groupsDB = ref.watch(groupsDBProvider);
    Group thisGrouping = groupsDB.getGroupById(id);

    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: Card(
          elevation: 8,
          child: Column(
            children: [
              ListTile(
                  title: Text(thisGrouping.groupName,
                      style: Theme.of(context).textTheme.titleLarge)),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text("${thisGrouping.semYear} | ${thisGrouping.owner}"),
                  )),
              if(thisGrouping.userIDs.length > 1 || thisGrouping.userIDs.isEmpty)
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,

                    child:
                    Text("${thisGrouping.userIDs.length} members"),
                  )),
              if(thisGrouping.userIDs.length == 1)
                Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                    child: Align(
                      alignment: Alignment.centerLeft,

                      child:
                      Text("${thisGrouping.userIDs.length} member"),
                    )),
              if (thisGrouping.newMessages.length > 1 || thisGrouping.newMessages.isEmpty)
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("${thisGrouping.newMessages.length} new messages"))),
              if (thisGrouping.newMessages.length == 1)
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("${thisGrouping.newMessages.length} new messages"))),
              const SizedBox(height: 10)
            ],
          )),
    );
  }
}
