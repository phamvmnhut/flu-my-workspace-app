import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../utils/bottom_sheets.dart';
import '../../values/values.dart';
import '../../widgets/bottom_sheet/dashboard_settings_sheet.dart';
import '../../widgets/buttons/primary_tab_buttons.dart';
import '../../widgets/navigation/dasboard_header.dart';
import '../chat_screen/chat_screen.dart';
import '../profile/profile_overview.dart';
import '../../widgets/shapes/app_settings_icon.dart';
import 'dashboard_tab_screen/overview.dart';
import 'dashboard_tab_screen/productivity.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final ValueNotifier<bool> _totalTaskTrigger = ValueNotifier(true);
  final ValueNotifier<bool> _totalDueTrigger = ValueNotifier(false);
  final ValueNotifier<bool> _totalCompletedTrigger = ValueNotifier(true);
  final ValueNotifier<bool> _workingOnTrigger = ValueNotifier(false);
  final ValueNotifier<int> _buttonTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardNav(
                icon: FontAwesomeIcons.comment,
                image: "assets/man-head.png",
                notificationCount: "2",
                page: const ChatScreen(),
                title: "Dashboard",
                onImageTapped: () {
                  Get.to(() => const ProfileOverview());
                },
              ),
              AppSpaces.verticalSpace20,
              Text(
                "Hello,\nDereck Doyle 👋",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              AppSpaces.verticalSpace20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //tab indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PrimaryTabButton(
                          buttonText: "Overview",
                          itemIndex: 0,
                          notifier: _buttonTrigger),
                      PrimaryTabButton(
                          buttonText: "Productivity",
                          itemIndex: 1,
                          notifier: _buttonTrigger)
                    ],
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: AppSettingsIcon(
                        callback: () {
                          showAppBottomSheet(
                            DashboardSettingsBottomSheet(
                              totalTaskNotifier: _totalTaskTrigger,
                              totalDueNotifier: _totalDueTrigger,
                              workingOnNotifier: _workingOnTrigger,
                              totalCompletedNotifier: _totalCompletedTrigger,
                            ),
                          );
                        },
                      ))
                ],
              ),
              AppSpaces.verticalSpace20,
              ValueListenableBuilder(
                  valueListenable: _buttonTrigger,
                  builder: (BuildContext context, _, __) {
                    return _buttonTrigger.value == 0
                        ? const DashboardOverview()
                        : const DashboardProductivity();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
