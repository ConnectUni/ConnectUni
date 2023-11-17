import 'package:connectuni/features/all_data_provider.dart';
import 'package:connectuni/features/group/domain/group_collection.dart';
import 'package:connectuni/features/group/presentation/edit_group_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../chat/domain/chat.dart';
import '../../chat/domain/chat_collection.dart';
import '../../cu_error.dart';
import '../../cu_loading.dart';
import '../../home/presentation/home.dart';
import '../../user/domain/user.dart';
import '../domain/group.dart';
import '../../message/domain/message.dart';
import 'form-fields/group_description_field.dart';
import 'form-fields/group_image_field.dart';
import 'form-fields/group_name_field.dart';
import 'form-fields/owner_field.dart';
import 'form-fields/reset_button.dart';
import 'form-fields/semyear_field.dart';
import 'form-fields/submit_button.dart';

//Creates a new Group
class AddGroup extends ConsumerWidget {
  AddGroup({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final _groupNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _semYearFieldKey = GlobalKey<FormBuilderFieldState>();
  final _ownerFieldKey = GlobalKey<FormBuilderFieldState>();
  final _groupImageFieldKey = GlobalKey<FormBuilderFieldState>();
  final _groupDescriptionFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncValue = ref.watch(allDataProvider);
    return asyncValue.when(
        data: (allData) =>
            _build(
                context: context,
                groups: allData.groups,
                chats: allData.chats,
                currentUser: allData.currentUser,
                ref: ref
            ),
        loading: () => const CULoading(),
        error: (e, st) => CUError(e.toString(), st.toString()));
  }

  Widget _build ({
    required BuildContext context,
    required List<Group> groups,
    required List<Chat> chats,
    required User currentUser,
    required WidgetRef ref,
  }) {
    GroupCollection groupCollection = GroupCollection(groups);
    ChatCollection chatCollection = ChatCollection(chats);

    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
      String groupID = groupCollection.getNewID();
      String groupName = _groupNameFieldKey.currentState?.value;
      String semYear = _semYearFieldKey.currentState?.value;
      String owner = _ownerFieldKey.currentState?.value; // Should owner be current user? Since user created this group no?
      String groupImage = _groupImageFieldKey.currentState?.value ?? '';
      String groupDescription = _groupDescriptionFieldKey.currentState?.value ?? '';
      String chatID = chatCollection.getNewID();
      Group newGroup = Group(
        groupID: groupID,
        groupName: groupName,
        semYear: semYear,
        owner: owner,
        groupImage: groupImage,
        groupDescription: groupDescription,
        newMessages: [],
        chatID: chatID,
        eventIDs: [],
        userIDs: [currentUser.uid],
        interests: [],
      );
      ref.read(editGroupControllerProvider.notifier).updateGroup(
        group: newGroup,
        onSuccess: () {
          Navigator.pushReplacementNamed(context, HomePage.routeName);
        },
      );
    }

    void onReset() {
      _formKey.currentState?.reset();
    }

    Widget addGroupForm() => ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      children: [
        Column(
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                  children: [
                    GroupNameField(fieldKey: _groupNameFieldKey),
                    SemYearField(fieldKey: _semYearFieldKey),
                    OwnerField(fieldKey: _ownerFieldKey),
                    GroupImageField(fieldKey: _groupImageFieldKey),
                    GroupDescriptionField(fieldKey: _groupDescriptionFieldKey),
                  ]
              ),
            ),
            Row(
                children: [
                  SubmitButton(onSubmit: onSubmit),
                  ResetButton(onReset: onReset),
                ]
            )
          ],
        ),
      ],
    );

    AsyncValue asyncUpdate = ref.watch(editGroupControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Group'),
      ),
      body: asyncUpdate.when(
        data: (_) => addGroupForm(),
        error: (e, st) => CUError(e.toString(), st.toString()),
        loading: () => const CULoading()));
  }
}
