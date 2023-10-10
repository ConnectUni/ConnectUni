import 'package:connectuni/model/user.dart';
import 'package:connectuni/model/user_card_serach.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../model/group.dart';

class SearchPeopleScreen extends StatefulWidget {
  const SearchPeopleScreen({Key? key, required this.pageController}) : super(key: key);

  static const String routeName = '/search_people';
  final PageController pageController;

  @override
  State<SearchPeopleScreen> createState() => _SearchPeopleScreenState();
}

class _SearchPeopleScreenState extends State<SearchPeopleScreen> {
  final _items = groupsDB.getGroups().map((gName) => MultiSelectItem(gName, gName.groupName)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for People'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
                Icons.arrow_back_ios,
                semanticLabel: 'Search for groups',
            ),
            onPressed: () {
              widget.pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              semanticLabel: 'Search for events',
            ),
            onPressed: () {
              widget.pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MultiSelectDialogField(
                items: _items,
                title: const Text("People"),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                buttonIcon: const Icon(
                  Icons.filter,
                  color: Colors.blue,
                ),
                buttonText: Text(
                  "Filter by:",
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  //_selectedAnimals = results;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      hintText: 'Search...',
                      leading: const Icon(Icons.search),
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  }),
            ),
            ...usersDB
                .getUsers().map((uName) => UserCardSearch(name: uName.uid)),
          ],
        ),
      ),
    );
  }
}
