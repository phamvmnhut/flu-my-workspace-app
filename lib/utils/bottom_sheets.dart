import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/values.dart';

// showSettingsBottomSheet() => showAppBottomSheet(ProjectDetailBottomSheet());

showAppBottomSheet(
  Widget widget, {
  bool isScrollControlled = false,
  bool popAndShow = false,
  double? height,
}) {
  if (popAndShow) Get.back();
  return Get.bottomSheet(
      height == null
          ? Wrap(children: [widget])
          : SizedBox(height: height, child: widget),
      backgroundColor: AppColors.primaryBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: isScrollControlled);
}
