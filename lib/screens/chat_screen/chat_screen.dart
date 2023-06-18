import 'package:flutter/material.dart';

import '../../data/data_model.dart';
import '../../values/values.dart';
import '../../widgets/chat/badged_title.dart';
import '../../widgets/chat/online_user.dart';
import '../../widgets/chat/selection_tab.dart';
import '../../widgets/dark_background/dark_radial_background.dart';
import '../../widgets/form/search_box.dart';
import '../../widgets/navigation/app_header.dart';
import '../../widgets/project/add_chat_icon.dart';

import 'new_group.dart';
import 'new_message_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeader(
                    title: "Chat",
                    widget: AppAddIcon(page: NewMessageScreen()),
                  ),
                  AppSpaces.verticalSpace20,
                  SearchBox(
                      placeholder: 'Search', controller: searchController),
                  AppSpaces.verticalSpace20,
                  const SelectionTab(title: "GROUP", page: NewGroupScreen()),
                  AppSpaces.verticalSpace20,
                  const BadgedTitle(
                    title: "Marketing",
                    color: 'A5EB9B',
                    number: '12',
                  ),
                  AppSpaces.verticalSpace20,
                  Transform.scale(
                      alignment: Alignment.centerLeft,
                      scale: 0.8,
                      child: buildStackedImages(numberOfMembers: "8")),
                  AppSpaces.verticalSpace20,
                  const BadgedTitle(
                    title: "Design",
                    color: 'FCA3FF',
                    number: '6',
                  ),
                  AppSpaces.verticalSpace20,
                  Transform.scale(
                      alignment: Alignment.centerLeft,
                      scale: 0.8,
                      child: buildStackedImages(numberOfMembers: "2")),
                  AppSpaces.verticalSpace20,
                  const SelectionTab(
                      title: "DIRECT MESSAGES", page: NewMessageScreen()),
                  AppSpaces.verticalSpace20,
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView(
                        children: List.generate(
                          AppData.onlineUsers.length,
                          (index) => OnlineUser(
                            image: AppData.onlineUsers[index]['profileImage'],
                            imageBackground: AppData.onlineUsers[index]
                                ['color'],
                            userName: AppData.onlineUsers[index]['name'],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
