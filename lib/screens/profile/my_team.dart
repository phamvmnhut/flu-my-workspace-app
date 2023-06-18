import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../data/data_model.dart';
import '../../values/values.dart';
import '../../widgets/add_sub_icon.dart';
import '../../widgets/container_label.dart';
import '../../widgets/dark_background/dark_radial_background.dart';
import '../../widgets/navigation/app_header.dart';

import '../../widgets/project/project_card_vertical.dart';

import 'team_details.dart';

class MyTeams extends StatelessWidget {
  const MyTeams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppHeader(
                        title: "$tabSpace $tabSpace Team",
                        widget: const Row(children: [
                          Icon(Icons.more_horiz, size: 30, color: Colors.white),
                          AppSpaces.horizontalSpace20,
                          AddSubIcon()
                        ])),
                    AppSpaces.verticalSpace40,
                    const TeamStory(
                        teamTitle: "Marketing",
                        numberOfMembers: "12",
                        noImages: "8"),
                    SizedBox(
                      height: Utils.screenHeight / 2,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => ProjectCardVertical(
                          projectName: AppData.productData[index]
                              ['projectName'],
                          category: AppData.productData[index]['category'],
                          color: AppData.productData[index]['color'],
                          ratingsUpperNumber: AppData.productData[index]
                              ['ratingsUpperNumber'],
                          ratingsLowerNumber: AppData.productData[index]
                              ['ratingsLowerNumber'],
                        ),
                        itemCount: 2,
                      ),
                    ),
                    AppSpaces.verticalSpace40,
                    const TeamStory(
                        teamTitle: "Design",
                        numberOfMembers: "20",
                        noImages: "16"),
                    SizedBox(
                      height: Utils.screenHeight / 2,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => ProjectCardVertical(
                          projectName: AppData.productData[index]
                              ['projectName'],
                          category: AppData.productData[index]['category'],
                          color: AppData.productData[index]['color'],
                          ratingsUpperNumber: AppData.productData[index]
                              ['ratingsUpperNumber'],
                          ratingsLowerNumber: AppData.productData[index]
                              ['ratingsLowerNumber'],
                        ),
                        itemCount: 4,
                      ),
                    ),
                    AppSpaces.verticalSpace40,
                    const TeamStory(
                        teamTitle: "Accounting",
                        numberOfMembers: "12",
                        noImages: "8"),
                    SizedBox(
                      height: Utils.screenHeight / 2,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => ProjectCardVertical(
                          projectName: AppData.productData[index]
                              ['projectName'],
                          category: AppData.productData[index]['category'],
                          color: AppData.productData[index]['color'],
                          ratingsUpperNumber: AppData.productData[index]
                              ['ratingsUpperNumber'],
                          ratingsLowerNumber: AppData.productData[index]
                              ['ratingsLowerNumber'],
                        ),
                        itemCount: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TeamStory extends StatelessWidget {
  final String teamTitle;
  final String numberOfMembers;
  final String noImages;

  const TeamStory({
    Key? key,
    required this.teamTitle,
    required this.numberOfMembers,
    required this.noImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(teamTitle, style: AppTextStyles.header2.copyWith(fontSize: 35)),
        AppSpaces.verticalSpace10,
        ContainerLabel(label: "$numberOfMembers Members"),
        AppSpaces.verticalSpace10,
        InkWell(
          onTap: () {
            Get.to(() => TeamDetails(title: teamTitle));
          },
          child: Transform.scale(
              alignment: Alignment.centerLeft,
              scale: 0.7,
              child:
                  buildStackedImages(numberOfMembers: noImages, addMore: true)),
        ),
      ],
    );
  }
}
