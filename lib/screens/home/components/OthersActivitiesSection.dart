// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/avaiable_bed/AvaiableBedScreen.dart';
import 'package:super_home_member/screens/home/widgets/GridViewActivitiesList.dart';
import 'package:super_home_member/screens/movie/movie_server.dart';
import 'package:super_home_member/screens/prothomalo/prothomalo.dart';
import 'package:super_home_member/screens/rules_regulations/RulesRegulationScreen.dart';

import '../../live_tv_new/start_screen.dart';

class OthersActivitiesSection extends StatelessWidget {
  const OthersActivitiesSection({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: defaultPaddingEdge,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(defaultPadding / 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: defaultPaddingEdge,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(defaultPadding / 2),
                  topRight: Radius.circular(defaultPadding / 2)),
            ),
            child: Text("Others".toUpperCase(),
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              shrinkWrap: true,
              controller: scrollController,
              children: [
                GridViewActivitiesList(
                  image: "assets/icons/rules_egulations.png",
                  title: "Rules and Regulations",
                  onPress: () => Get.to(RulesRegulationScreen()),
                ),
                GridViewActivitiesList(
                  image: "assets/icons/live_tv.png",
                  title: "Live TV",
                  onPress: () {
                    Get.to(DemoPage());
                    // Get.snackbar(
                    //     'Coming soon', "Live TV cominng soon next version",
                    //     snackPosition: SnackPosition.BOTTOM,
                    //     margin: const EdgeInsets.symmetric(
                    //         horizontal: defaultPadding / 2,
                    //         vertical: defaultPadding));
                  },
                ),
                GridViewActivitiesList(
                  image: "assets/icons/cinema.png",
                  title: "Movie Server",
                  onPress: () {
                    Get.to(const MovieServer());
                    // Get.snackbar(
                    //     'Coming soon', "FTP Server coming soon next version",
                    //     snackPosition: SnackPosition.BOTTOM,
                    //     margin: const EdgeInsets.symmetric(
                    //         horizontal: defaultPadding / 2,
                    //         vertical: defaultPadding)
                    // );
                  },
                ),
                GridViewActivitiesList(
                  image: "assets/icons/avaiable_bed.png",
                  title: "Available Bed",
                  onPress: () => Get.to(const AvaiableBedScreen()),
                ),
                GridViewActivitiesList(
                  image: "assets/icons/p5.png",
                  title: "All Newspaper",
                  onPress: () => Get.to(const Prothomalo()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
