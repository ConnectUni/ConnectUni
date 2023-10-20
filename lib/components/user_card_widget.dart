import 'package:connectuni/components/user_card_search.dart';
import 'package:flutter/cupertino.dart';
import '../model/user.dart';
import '../screens/other_user_profile.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => OtherUserProfile(user: user,)
          )
        );
      },
      child: UserCardSearch(user: user),
    );
  }
}
