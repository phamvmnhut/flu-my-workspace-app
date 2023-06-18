import 'package:flutter/material.dart';

import '../../data/data_model.dart';
import '../../values/values.dart';
import '../../widgets/dummy/profile_dummy.dart';
import '../../widgets/navigation/default_back.dart';
import '../../widgets/notification/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic notificationData = AppData.notificationMentions;

    List<Widget> notificationCards = List.generate(
        notificationData.length,
        (index) => Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: NotificationCard(
                read: notificationData[index]['read'],
                userName: notificationData[index]['mentionedBy'],
                date: notificationData[index]['date'],
                image: notificationData[index]['profileImage'],
                mentioned: notificationData[index]['hashTagPresent'],
                message: notificationData[index]['message'],
                mention: notificationData[index]['mentionedIn'],
                imageBackground: notificationData[index]['color'],
                userOnline: notificationData[index]['userOnline'],
              ),
            ));
    return SafeArea(
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 20),
          child:
              DefaultNav(title: "Notification", type: ProfileDummyType.Image),
        ),
        AppSpaces.verticalSpace20,
        Expanded(child: ListView(children: [...notificationCards]))
      ]),
    );
  }
}
