import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/project/create_project.dart';
import '../../screens/project/set_members.dart';
import '../../screens/task_screen/task_due_date.dart';
import '../../utils/bottom_sheets.dart';
import '../../values/values.dart';

import 'bottom_sheet_holder.dart';
import '../onboarding/labelled_option.dart';
import '../dashboard/create_task.dart';

class DashboardAddBottomSheet extends StatelessWidget {
  const DashboardAddBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppSpaces.verticalSpace10,
      const BottomSheetHolder(),
      AppSpaces.verticalSpace10,
      LabelledOption(
        label: 'Create Task',
        icon: Icons.add_to_queue,
        callback: _createTask,
      ),
      LabelledOption(
          label: 'Create Project',
          icon: Icons.device_hub,
          callback: () {
            Get.to(() => const CreateProjectScreen());
          }),
      LabelledOption(
          label: 'Create team',
          icon: Icons.people,
          callback: () {
            Get.to(() => const SelectMembersScreen());
          }),
      LabelledOption(
          label: 'Create Event',
          icon: Icons.fiber_smart_record,
          callback: () {
            Get.to(() => const TaskDueDate());
          }),
    ]);
  }

  void _createTask() {
    showAppBottomSheet(
      CreateTaskBottomSheet(),
      isScrollControlled: true,
      popAndShow: true,
    );
  }
}
