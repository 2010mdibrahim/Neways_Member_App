// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/bloc/SHPointController.dart';

class WelcomeAndSHPointSectionTest extends StatelessWidget {
  const WelcomeAndSHPointSectionTest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SHPointController>(
        init: SHPointController(),
        builder: (controller) {
          return Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                margin: defaultPaddingEdge,
                padding: defaultPaddingEdge,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
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
              ),
              Positioned(
                  left: 20,
                  right: 20,
                  top: 160,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 2),
                            color: Colors.white,
                          ),
                          child: const Text("SH Point"),
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Expanded(
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 2),
                            color: Colors.white,
                          ),
                          child: const Text("SH Point"),
                        ),
                      )
                    ],
                  ))
            ],
          );
        });
  }
}
