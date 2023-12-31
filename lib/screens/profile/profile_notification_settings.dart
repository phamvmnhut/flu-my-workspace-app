import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../../values/values.dart';
import '../../widgets/buttons/primary_progress_button.dart';
import '../../widgets/container_label.dart';
import '../../widgets/dark_background/dark_radial_background.dart';
import '../../widgets/navigation/app_header.dart';
import '../../widgets/onboarding/labelled_option.dart';

class ProfileNotificationSettings extends StatelessWidget {
  const ProfileNotificationSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assignmedToMe = ValueNotifier(true);
    final taskCompleted = ValueNotifier(false);
    final mentionedMe = ValueNotifier(true);
    final directMessage = ValueNotifier(false);
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      AppHeader(
                        title: "$tabSpace Notifications",
                        widget: PrimaryProgressButton(
                          width: 80,
                          height: 40,
                          label: "Done",
                          textStyle: GoogleFonts.lato(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      AppSpaces.verticalSpace40,
                      Container(
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.primaryBackgroundColor),
                          child: const Column(children: [
                            LabelledOption(
                              label: '30 minutes',
                              icon: Icons.lock_clock,
                            ),
                            LabelledOption(
                              label: '1 hour',
                              icon: Icons.lock_clock,
                            ),
                            LabelledOption(
                              label: 'Until Tomorrow',
                              icon: Icons.calendar_today,
                            ),
                            LabelledOption(
                              label: 'Until next 2 days',
                              icon: Icons.calendar_today,
                            ),
                            LabelledOption(
                              label: 'Custom',
                              icon: Icons.calendar_today,
                            ),
                          ])),
                      AppSpaces.verticalSpace40,
                      const ContainerLabel(label: "NOTIFY MY ABOUT"),
                      AppSpaces.verticalSpace10,
                      LabelledCheckbox(
                        label: "Task assigned to me",
                        notifierValue: assignmedToMe,
                      ),
                      LabelledCheckbox(
                          label: "Task completed",
                          notifierValue: taskCompleted),
                      LabelledCheckbox(
                          label: "Mentioned Me", notifierValue: mentionedMe),
                      LabelledCheckbox(
                          label: "Direct Message",
                          notifierValue: directMessage),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LabelledCheckbox extends StatelessWidget {
  final String label;
  final ValueNotifier<bool>? notifierValue;

  const LabelledCheckbox({
    required this.label,
    Key? key,
    this.notifierValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.lato(color: Colors.white, fontSize: 17)),
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.grey,
          ),
          child: ValueListenableBuilder(
              valueListenable: notifierValue!,
              builder: (BuildContext context, _, __) {
                return Checkbox(
                    value: notifierValue!.value,
                    activeColor: AppColors.primaryAccentColor,
                    onChanged: (bool? value) => notifierValue!.value = value!);
              }),
        ),
      ],
    );
  }
}
