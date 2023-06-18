import 'package:flutter/material.dart';

import '../../values/values.dart';

import '../bottom_sheet/bottom_sheet_holder.dart';
import '../container_label.dart';
import '../form/form_input_with _label.dart';

class MoreTeamDetailsSheet extends StatelessWidget {
  const MoreTeamDetailsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final workSpaceNameController = TextEditingController();
    final teamNameController = TextEditingController();
    return Column(children: [
      AppSpaces.verticalSpace10,
      const BottomSheetHolder(),
      AppSpaces.verticalSpace40,
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelledFormInput(
                placeholder: "Blake Gordon",
                keyboardType: "text",
                value: "Blake Gordon",
                controller: workSpaceNameController,
                obscureText: false,
                label: "WorkSpace"),
            AppSpaces.verticalSpace20,
            LabelledFormInput(
                placeholder: "Marketing",
                keyboardType: "text",
                controller: teamNameController,
                obscureText: true,
                label: "TEAM NAME"),
            AppSpaces.verticalSpace20,
            const ContainerLabel(label: "Members"),
            AppSpaces.verticalSpace10,
            Transform.scale(
                alignment: Alignment.centerLeft,
                scale: 0.7,
                child: buildStackedImages(numberOfMembers: "8", addMore: true)),
          ],
        ),
      ),
    ]);
  }
}
