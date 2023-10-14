// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/bloc/SHPointController.dart';
import 'package:super_home_member/screens/login/LoginScreen.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SHPointController>(
        init: SHPointController(),
        builder: (controller) {
          return Container(
            height: 150,
            width: double.infinity,
            margin: defaultPaddingEdge,
            padding: defaultPaddingEdge,
            decoration: BoxDecoration(
              boxShadow: const [
                // BoxShadow(
                //   color: Colors.grey.shade400,
                //   spreadRadius: 5,
                //   blurRadius: 7,
                //   offset: const Offset(0, 3), // changes position of shadow
                // ),
                // BoxShadow(
                //   color: Colors.grey.withOpacity(0.5),
                //   spreadRadius: 5,
                //   blurRadius: 7,
                //   offset: const Offset(0, -3), // changes position of shadow
                // ),
              ],
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/firstclass.jpg",
                  )),
              borderRadius: BorderRadius.circular(defaultPadding / 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Welcome to \n',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade200,fontWeight: FontWeight.w600),
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Super Hostel',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                GestureDetector(
                  onTap: (() => Get.to(const LoginScreen())),
                  child: Container(
                    width: size.width * 0.35,
                    alignment: Alignment.center,
                    padding: defaultPaddingEdge,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          WidgetSpan(
                              child: Icon(
                            Icons.touch_app_rounded,
                            color: Colors.white,
                            size: 18,
                          )),
                          TextSpan(
                              text: ' Log In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
