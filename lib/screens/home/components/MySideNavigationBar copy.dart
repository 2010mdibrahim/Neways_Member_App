// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import '../bloc/MenuController.dart';

class MySideNavigationBar extends StatelessWidget {
  const MySideNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<CustomeMenuController>(
        init: CustomeMenuController(),
        builder: (controller) {
          return Positioned(
            top: controller.offset.dy,
            bottom: 50, //size.height * 0.15
            left: 0,
            child: Row(
              children: [
                Visibility(
                  visible: controller.isSliderOpen,
                  child: Container(
                    width: size.width * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      border: Border.all(color: Colors.black87),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(defaultPadding / 2),
                          topRight: Radius.circular(defaultPadding / 2)),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.home_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.card_giftcard_rounded,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.notifications_none_rounded,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.supervised_user_circle_sharp,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -.6),
                  child: GestureDetector(
                    onTap: () {
                      controller.onPressMenuButton();
                    },
                    onPanUpdate: ((details) => controller.onPanUpdate(details)),
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        width: 30,
                        height: 110,
                        color: Colors.black87,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          controller.isSliderOpen ? Icons.close : Icons.menu,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
