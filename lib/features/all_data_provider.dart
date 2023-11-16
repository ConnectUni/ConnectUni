import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user/data/user_providers.dart';
import 'user/domain/user.dart';
import 'group/data/group_providers.dart';
import 'group/domain/group.dart';
import 'event/data/event_providers.dart';
import 'event/domain/event.dart';
import 'chat/data/chat_providers.dart';
import 'chat/domain/chat.dart';
import 'message/data/message_providers.dart';
import 'message/domain/message.dart';

part 'all_data_provider.g.dart';

class AllData {
  AllData({
    required this.users,
    required this.groups,
    required this.events,
    required this.chats,
    required this.messages,
    required this.currentUserID,
  });

  final List<User> users;
  final List<Group> groups;
  final List<SingleEvent> events;
  final List<Chat> chats;
  final List<Message> messages;
  final String currentUserID;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final users = ref.watch(usersProvider.future);
  final groups = ref.watch(groupsProvider.future);
  final events = ref.watch(eventsProvider.future);
  final chats = ref.watch(chatsProvider.future);
  final messages = ref.watch(messagesProvider.future);
  final currentUserID = ref.watch(currentUserIDProvider);
  return AllData(
    users: await users,
    groups: await groups,
    events: await events,
    chats: await chats,
    messages: await messages,
    currentUserID: currentUserID,
  );
}