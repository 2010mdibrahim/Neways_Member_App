// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/widgets/GridViewFacilitiesList.dart';

class FacilitiesSection extends StatelessWidget {
  const FacilitiesSection({
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
        color: Colors.white,
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
            child: Text("Our Facilities".toUpperCase(),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          ),
          Padding(
            padding: defaultPaddingEdge,
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              shrinkWrap: true,
              controller: scrollController,
              children: [
                GridViewFacilitiesList(
                  image: "assets/icons/ac.png",
                  title: "Air Condition",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/cctv1.png",
                  title: "24 Hours Security",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/gym.png",
                  title: "GYM",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/hairdryer.png",
                  title: "Hair Dryer",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/wifi.png",
                  title: "Wi-Fi",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/fingeraccess.png",
                  title: "Finger Print Entrance",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/firesafe.png",
                  title: "Fire Safety",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/washingmachine.png",
                  title: "Washing Machine",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/smarttv.png",
                  title: "Smart TV",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/generator.png",
                  title: "Generator",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/shoepolisher.png",
                  title: "Shoe Polish",
                  onPress: () {},
                ),
                GridViewFacilitiesList(
                  image: "assets/icons/housekeeing.png",
                  title: "Cleaning Service",
                  onPress: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
