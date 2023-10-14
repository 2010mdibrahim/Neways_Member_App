// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/widgets/RecentActivitiesList.dart';

class RecentActivitiesSection extends StatelessWidget {
  const RecentActivitiesSection({
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
            child: const Text("Recent Activities"),
          ),
          ListView(
            shrinkWrap: true,
            controller: scrollController,
            children: [
              RecentActivitiesList(
                title:
                    "Track web browsing including time spent on each site, the exact URL, the web page title, and more",
                onPress: () {},
              ),
              RecentActivitiesList(
                title:
                    "Track web browsing including time spent on each site, the exact URL, the web page title, and more",
                onPress: () {},
              ),
              RecentActivitiesList(
                title:
                    "Track web browsing including time spent on each site, the exact URL, the web page title, and more",
                onPress: () {},
              ),
              RecentActivitiesList(
                title:
                    "Track web browsing including time spent on each site, the exact URL, the web page title, and more",
                onPress: () {},
              ),
              RecentActivitiesList(
                title:
                    "Track web browsing including time spent on each site, the exact URL, the web page title, and more",
                onPress: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
