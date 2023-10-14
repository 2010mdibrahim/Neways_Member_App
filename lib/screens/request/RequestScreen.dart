// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/request/bed/components/BedRequestListScreen.dart';
import 'package:super_home_member/screens/request/bloc/ContactController.dart';
import 'package:super_home_member/screens/request/branch/components/BranchRequestListScreen.dart';
import 'package:super_home_member/screens/request/card/components/CardRequestListScreen.dart';
import 'package:super_home_member/screens/request/complain/components/ComplainListScreen.dart';
import 'package:super_home_member/screens/request/feedback/FeedbackScreen.dart';
import 'package:super_home_member/screens/request/food_request/components/FoodRequestMealScreen.dart';
import 'package:super_home_member/screens/request/leave/components/LeaveReasonScreen.dart';
import 'package:super_home_member/screens/request/package/components/PackageRequestListScreen.dart';
import 'package:super_home_member/screens/widgets/SideNavContainer.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class RequestScreen extends StatelessWidget {
   RequestScreen({Key? key}) : super(key: key);
  final contactService = Get.put(ContactController());
  @override
  Widget build(BuildContext context) {
    return SideNavContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
            toolbarHeight: 35,
            title: const Text("Member Accessiablity"), centerTitle: true),
        body: Container(
          padding: defaultPaddingEdge,
          child: ListView(
            children: [
              Row(
                children: [
                  AccessiabiltyCard(
                    title: "Request For Meal",
                    image: "assets/icons/dining.png",
                    onPress: (() => Get.to(const FoodRequestMealScreen())),
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  AccessiabiltyCard(
                    title: "Branch Change Request",
                    image: "assets/icons/branch_change.png",
                    onPress: (() => Get.to(BranchRequestListScreen())),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  AccessiabiltyCard(
                    onPress: (() => Get.to(PackageRequestListScreen())),
                    image: 'assets/icons/package_shifting.png',
                    title: 'Package Change Request',
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  AccessiabiltyCard(
                    onPress: (() => Get.to(BedRequestListScreen())),
                    image: 'assets/icons/bed_change.png',
                    title: 'Bed Change Request',
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  AccessiabiltyCard(
                    onPress: (() => Get.to(CardRequestListScreen())),
                    image: 'assets/icons/card_change.png',
                    title: 'Card Change Request',
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  AccessiabiltyCard(
                    onPress: (() => Get.to(const FeedbackScreen())),
                    image: 'assets/icons/suggestion.png',
                    title: 'Feedback',
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  AccessiabiltyCard(
                    onPress: (() => Get.to(ComplainListScreen())),
                    image: 'assets/icons/complain.png',
                    title: 'Complaint',
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  AccessiabiltyCard(
                    onPress: (() => Get.to(const LeaveReasonScreen())),
                    image: 'assets/icons/leave.png',
                    title: 'Request for Cancel',
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              // Row(
              //   children: [
              //     AccessiabiltyCard(
              //       onPress: (() => Get.to(ComplainListScreen())),
              //       image: 'assets/icons/complain.png',
              //       title: 'Complaint',
              //     ),
              //     const SizedBox(width: defaultPadding / 2),
              //     AccessiabiltyCard(
              //       onPress: (() => Get.to(
              //           CancelRequestScreen(title: "Member Cancel Request"))),
              //       image: 'assets/icons/cancelation.png',
              //       title: 'Member Cancel Request',
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccessiabiltyCard extends StatelessWidget {
  VoidCallback onPress;
  String image;
  String title;
  AccessiabiltyCard({
    Key? key,
    required this.onPress,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: defaultPaddingEdge,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.teal[100], borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(image, width: 46, fit: BoxFit.fill),
              const SizedBox(width: defaultPadding / 4),
              Expanded(
                  child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

// GridView.count(
//             crossAxisCount: 2,
//             crossAxisSpacing: defaultPadding / 2,
//             mainAxisSpacing: defaultPadding / 2,
//             children: [
//               GridViewList(
//                 onPress: (() => Get.to(const FoodRequestMealScreen())),
//                 image: 'assets/icons/dining.png',
//                 title: 'Request For Meal',
//                 fontSize: 12,
//                 imageSize: 60,
//               ),
//               GridViewList(
//                 onPress: (() => Get.to(BranchRequestListScreen())),
//                 image: 'assets/icons/branch_change.png',
//                 title: 'Branch Change Request',
//                 fontSize: 12,
//                 imageSize: 60,
//               ),
//               GridViewList(
//                 onPress: (() => Get.to(PackageRequestListScreen())),
//                 image: 'assets/icons/package_shifting.png',
//                 title: 'Package Change Request',
//                 fontSize: 12,
//                 imageSize: 60,
//               ),
//               GridViewList(
//                 onPress: (() => Get.to(BedRequestListScreen())),
//                 image: 'assets/icons/bed_change.png',
//                 title: 'Bed Change Request',
//                 fontSize: 12,
//                 imageSize: 60,
//               ),
//               GridViewList(
//                 onPress: (() => Get.to(CardRequestListScreen())),
//                 image: 'assets/icons/card_change.png',
//                 title: 'Card Change Request',
//                 fontSize: 12,
//                 imageSize: 60,
//               ),
//               GridViewList(
//                 onPress: (() => Get.to(const FeedbackScreen())),
//                 image: 'assets/icons/suggestion.png',
//                 title: 'Feedback',
//                 fontSize: 12,
//                 imageSize: 60,
//               ),
//               GridViewList(
//                 onPress: (() => Get.to(ComplainListScreen())),
//                 image: 'assets/icons/complain.png',
//                 title: 'Complaint',
//                 fontSize: 12,
//                 imageSize: 60,
//               ),
//               GridViewList(
//                 onPress: (() => Get.to(
//                     CancelRequestScreen(title: "Member Cancel Request"))),
//                 image: 'assets/icons/cancelation.png',
//                 title: 'Member Cancel Request',
//                 fontSize: 12,
//                 imageSize: 60,
//               ),
//             ],
//           ),