// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/buy_sell/BuySellScreen.dart';
import 'package:super_home_member/screens/event/EventScreen.dart';
import 'package:super_home_member/screens/home/widgets/GridViewActivitiesList.dart';
import 'package:super_home_member/screens/news/components/NewsScreen.dart';
import 'package:super_home_member/screens/offers/OffersScreen.dart';


class ActivitiesSection extends StatelessWidget {
  const ActivitiesSection({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
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
                  topRight: Radius.circular(defaultPadding / 2)
              ),
            ),
            child:  Text("Activities".toUpperCase(),
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                )
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 2,
            shrinkWrap: true,
            controller: scrollController,
            children: [
              GridViewActivitiesList(
                image: "assets/icons/shop.png",
                title: "Buy & Sell",
                onPress: () => Get.to(const BuySellScreen()),
              ),
              GridViewActivitiesList(
                image: "assets/icons/offers.png",
                title: "Offers",
                onPress: () => Get.to(const OffersScreen()),
              ),
              GridViewActivitiesList(
                image: "assets/icons/news.png",
                title: "News",
                onPress: () => Get.to(const NewsScreen()),
              ),
              GridViewActivitiesList(
                image: "assets/icons/event.png",
                title: "Event",
                onPress: () => Get.to(EventScreen()),
              ),
            ],
          )
        ],
      ),
    );
  }
}
