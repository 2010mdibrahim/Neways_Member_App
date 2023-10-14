// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/profile/bloc/ProfileController.dart';
import 'package:super_home_member/screens/profile/widgets/buildCoverImage.dart';
import 'package:super_home_member/screens/profile/widgets/buildProfileImage.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double coverHeight = size.height * .28;
    const double profileHeight = 130;
    late double top = coverHeight - profileHeight / 2;
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Container(
            margin: const EdgeInsets.only(bottom: profileHeight / 2),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                buildCoverImage(coverHeight, "assets/images/firstclass.jpg"),
                Positioned(
                    top: top,
                    child: buildProfileImage(
                        profileHeight, controller.user.avater
                    )
                ),
              ],
            ),
          );
        }
        );
  }
}
