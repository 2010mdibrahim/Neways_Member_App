// ignore_for_file: file_names, must_be_immutable, duplicate_ignore
/// controller.user.name => comment out
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/profile/bloc/ProfileController.dart';
import 'package:super_home_member/screens/profile/components/ProfileTabSection.dart';
import 'package:super_home_member/screens/profile/components/ProfileTopSection.dart';

// ignore: must_be_immutable
class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else {
            return Container(
              // height: 120,
              color: Colors.blue[60],
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      children: [
                        const ProfileTopSection(),
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "Member",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(
                            Icons.add_moderator,
                            color: Colors.grey.shade700,
                            size: 18,
                          ),),
                          TextSpan(
                            text: " " + GetStorage().read('packageName'),
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.normal),
                          )
                            ]
                            )
                        ),
                        // TextButton.icon(
                        //     onPressed: () {},
                        //     style: TextButton.styleFrom(
                        //         elevation: 5,
                        //         primary: Colors.white,
                        //         backgroundColor: primaryColor,
                        //         padding:
                        //             const EdgeInsets.symmetric(horizontal: defaultPadding),
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(29))),
                        //     icon: const Icon(
                        //       Icons.edit_outlined,
                        //       size: 18,
                        //     ),
                        //     label: const Text("UPDATE"))

                        // const SizedBox(height: defaultPadding / 2),
                        const ProfileTabSection(),
                      ],
                    ),
                  ),
                  Positioned(

                    top: defaultPadding,
                    left: defaultPadding,
                    child: Container(
                      alignment: Alignment.center,
                      // padding: const EdgeInsets.all(defaultPadding / 2),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: IconButton(
                        onPressed: (() => Navigator.pop(context)),
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
        );
  }
}


/// old
/*
// ignore_for_file: file_names, must_be_immutable, duplicate_ignore
/// controller.user.name => comment out
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/profile/bloc/ProfileController.dart';
import 'package:super_home_member/screens/profile/components/ProfileTabSection.dart';
import 'package:super_home_member/screens/profile/components/ProfileTopSection.dart';

// ignore: must_be_immutable
class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else {
            return Stack(
              children: [
                SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    children: [
                      const ProfileTopSection(),
                      const SizedBox(height: defaultPadding / 2),
                      Text(
                        "Member",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.add_moderator,
                          color: Colors.grey.shade700,
                          size: 18,
                        )),
                        TextSpan(
                          text: " " + GetStorage().read('packageName'),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.normal),
                        )
                      ])),
                      // TextButton.icon(
                      //     onPressed: () {},
                      //     style: TextButton.styleFrom(
                      //         elevation: 5,
                      //         primary: Colors.white,
                      //         backgroundColor: primaryColor,
                      //         padding:
                      //             const EdgeInsets.symmetric(horizontal: defaultPadding),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(29))),
                      //     icon: const Icon(
                      //       Icons.edit_outlined,
                      //       size: 18,
                      //     ),
                      //     label: const Text("UPDATE"))

                      // const SizedBox(height: defaultPadding / 2),

                      const ProfileTabSection(),
                    ],
                  ),
                ),
                Positioned(
                  top: defaultPadding,
                  left: defaultPadding,
                  child: Container(
                    alignment: Alignment.center,
                    // padding: const EdgeInsets.all(defaultPadding / 2),
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: (() => Navigator.pop(context)),
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}

 */