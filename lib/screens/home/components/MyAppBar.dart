// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/profile/ProfileScreen.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      decoration: const BoxDecoration(
        color: primaryColor,
        // border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(right: defaultPadding / 2),
            height: 46,
            child: Image.asset(
              "assets/images/super-home-logo.png",
              fit: BoxFit.cover,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
                child: Container(
                  width: 42,
                  height: 42,
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/avater.png'),
                        fit: BoxFit.cover,
                        alignment: Alignment.center),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: bodyColor,
                      width: 1.5,
                    ),
                  ),
                  // child: ClipRRect(
                  //   child: Image.asset("assets/images/profile-icons.png"),
                  // ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: defaultPadding / 2, top: defaultPadding),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text(
              //         "Nazim Uddin",
              //         style: TextStyle(
              //             fontSize: 14,
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       GradientText(
              //         'Platinum',
              //         style: const TextStyle(
              //             fontSize: 12,
              //             letterSpacing: 1.2,
              //             fontWeight: FontWeight.bold),
              //         gradient: LinearGradient(colors: [
              //           Colors.yellow.shade100,
              //           Colors.yellow.shade500,
              //           Colors.yellow.shade800,
              //         ]),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),

          // IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.notifications, color: Colors.white)),
        ],
      ),
    );
  }
}
