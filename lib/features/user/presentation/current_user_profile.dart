import 'package:connectuni/features/interest/presentation/edit_interests.dart';
import 'package:connectuni/features/user/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:connectuni/features/user/domain/user_list.dart';
import '../../group/data/group_providers.dart';
import '../../group/domain/group.dart';
import '../../group/domain/group_list.dart';
import '../../group/presentation/add_group.dart';
import '../../interest/data/interests.dart';
import '../data/user_providers.dart';
import 'edit_user.dart';
import 'friend_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///  Profile Page that the User sees when they click the Navbar Profile icon.

class CurrentUserProfilePage extends ConsumerStatefulWidget {
  const CurrentUserProfilePage({Key? key});

  @override
  CurrentUserProfilePageState createState() => CurrentUserProfilePageState();
}

class CurrentUserProfilePageState extends ConsumerState<CurrentUserProfilePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserList userList = ref.watch(userDBProvider);
    final User currentUser = userList.getUserByID(ref.watch(currentUserProvider));
    final GroupList groupDB = ref.watch(groupsDBProvider);
    final List<String> interestsDB = ref.watch(interestsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.people,
                semanticLabel: 'friends list',
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FriendsList();
                }));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                semanticLabel: 'settings',
              ),
              onPressed: () {
                //Routes to the Settings Page.
                Navigator.restorablePushNamed(context, '/settings',
                    arguments: '/');
              },
            ),
          ],
        ),
        body: ListView(padding: const EdgeInsets.all(20.0), children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(currentUser.pfp),
              ),
            ]),
            Expanded(
              child: Column(
                children: [
                  Text(
                    currentUser.displayName,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Major: ${currentUser.major}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Projected Grad: ${currentUser.projectedGraduation}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          return EditUser(id: currentUser.uid);
                        }));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: const Text('Edit Profile'),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          const Divider(
            height: 7,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Your Interests:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                //TODO: Implement interests section here.
                Column(children: [
                  //TODO: Implement functionality and make cards interactive rather than simply visual.
                  ...currentUser.interests.map(
                    (interest) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Center(
                            child: Text(interest,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))),
                        textColor: Colors.white,
                        tileColor: Colors.lightBlue,
                      ),
                    ),
                    // textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          return EditInterest(id: currentUser.uid, type: "user");
                        }));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: const Text('Edit Interests'),
                    ),
                  ),
                ]), //Gallery
                const Divider(
                  height: 7,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //GroupCardView(name: "ICS 466"),
                      //GroupCardView(name: "ICS 312"),
                      const Text(
                        "Your Groups:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Column(children: [
                        if(groupDB.getGroupsByUser(currentUser.uid).isEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                const Text(
                                  "Oops! You aren't in any groups yet.",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) {
                                      return AddGroup();
                                    }));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors.blueAccent),
                                    foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors.white),
                                  ),
                                  child: const Text('Add a Group'),
                                )
                              ]
                            )
                          ),
                        if(groupDB.getGroupsByUser(currentUser.uid).isNotEmpty)
                        ...groupDB.getGroupsByUser(currentUser.uid).map(
                              (group) => Card(
                                elevation: 8,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                    color: Colors.grey.withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(group.groupName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, top: 5.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "${group.semYear} | ${group.owner}"),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, top: 2.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "${group.userIDs.length} people"),
                                        )),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: TextButton(
                                            onPressed: () {
                                            //Remove the user from the group's database. Then Refresh the group's database.
                                            group.userIDs.remove(currentUser.uid);
                                             //TODO: Remove groupId from user.
                                            ref.refresh(groupsDBProvider);
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.redAccent),
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                            ),
                                            child: const Text('LEAVE'),
                                          ),
                                        )),
                                    const SizedBox(height: 10)
                                  ],
                                ),
                              ),
                            ),
                      ]),
                    ],
                  ),
                ), //Courses
              ],
            ),
          )
        ])); //Scaffold
  } //build
} //HomePage
