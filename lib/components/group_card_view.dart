import 'package:flutter/material.dart';
import 'package:connectuni/model/group.dart';
import '../model/group_list.dart';

class GroupCardView extends StatelessWidget {
  const GroupCardView({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    Group thisGrouping = TempGroupsDB.getGroupById(id);

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
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("${thisGrouping.userIDs.length} people"),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("${thisGrouping.newMessages} new messages"))),
              const SizedBox(height: 10)
            ],
          )),
    );
  }
}
