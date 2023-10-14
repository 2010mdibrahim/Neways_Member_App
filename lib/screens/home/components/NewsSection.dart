// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/bloc/LatestNewsController.dart';
import 'package:super_home_member/screens/home/components/NewsDetailsScreen.dart';
import 'package:super_home_member/screens/home/widgets/NewsList.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LatestNewsController>(
        init: LatestNewsController(),
        builder: (controller) {
          if (controller.news.isEmpty) {
            return Container();
          }
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
                  child:  Text("Latest News".toUpperCase(),
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  itemCount: controller.news.length,
                  itemBuilder: (context, index) {
                    return NewsList(
                        onPress: () => Get.to(NewsDetailsScreen(
                            slug: controller.news[index].slug)),
                        title: controller.news[index].title,);
                  },
                ),
              ],
            ),
          );
        });
  }
}
