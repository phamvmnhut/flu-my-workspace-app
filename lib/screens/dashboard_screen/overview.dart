import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../utils/bottom_sheets.dart';
import '../../values/values.dart';
import '../../widgets/dark_background/dark_radial_background.dart';
import '../../widgets/dashboard/bottomNavigationItem.dart';
import '../../widgets/dashboard/dashboard_add_icon.dart';
import '../../widgets/dashboard/dashboard_add_sheet.dart';

import 'dashboard.dart';

class Architecture extends StatefulWidget {
  const Architecture({Key? key}) : super(key: key);

  @override
  State<Architecture> createState() => _ArchitectureState();
}

class _ArchitectureState extends State<Architecture> {
  final List<Widget> dashBoardScreens = [
    Dashboard(),
    // ProjectScreen(),
    // NotificationScreen(),
    // SearchScreen()
  ];

  ValueNotifier<int> bottomNavigatorTrigger = ValueNotifier(0);

  StatelessWidget currentScreen = Dashboard();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor.fromHex("#181a1f"),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          ValueListenableBuilder(
              valueListenable: bottomNavigatorTrigger,
              builder: (BuildContext context, _, __) {
                return PageStorage(
                    bucket: bucket,
                    child: dashBoardScreens[bottomNavigatorTrigger.value]);
              })
        ]),
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 90,
            padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: HexColor.fromHex("#181a1f").withOpacity(0.8)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationItem(
                      itemIndex: 0,
                      notifier: bottomNavigatorTrigger,
                      icon: Icons.widgets),
                  const Spacer(),
                  BottomNavigationItem(
                      itemIndex: 1,
                      notifier: bottomNavigatorTrigger,
                      icon: FeatherIcons.clipboard),
                  const Spacer(),
                  DashboardAddButton(
                    iconTapped: (() {
                      showAppBottomSheet(const DashboardAddBottomSheet());
                    }),
                  ),
                  const Spacer(),
                  BottomNavigationItem(
                      itemIndex: 2,
                      notifier: bottomNavigatorTrigger,
                      icon: FeatherIcons.bell),
                  const Spacer(),
                  BottomNavigationItem(
                      itemIndex: 3,
                      notifier: bottomNavigatorTrigger,
                      icon: FeatherIcons.search)
                ])));
  }
}
