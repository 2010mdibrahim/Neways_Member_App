// ignore_for_file: file_names, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/bloc/ProfileHomeController.dart';

class AppbarProfileSection extends StatelessWidget {
  const AppbarProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GetBuilder<ProfileHomeController>(
          init: ProfileHomeController(),
          builder: (controller) {
            return Container(
              decoration: const BoxDecoration(),
              child: Stack(children: [
                Opacity(
                  opacity: 0.5,
                  child: ClipPath(
                    clipper: CustomWaveClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        // Colors.purple.shade400,
                        // Colors.purple.shade900
                        Colors.teal,
                        // Colors.white,
                        // Color.fromARGB(255, 3, 45, 117)
                        Color.fromARGB(200, 300, 50, 200)
                      ])),
                      height: 140,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: CustomWaveClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.cyan,
                      // Color.fromARGB(255, 3, 45, 117)
                      Color.fromARGB(100, 10, 50, 120)
                      // Color.fromARGB(50, 50, 50, 50)
                        ],
                        )
                    ),
                    height: 138,
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding / 2),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Container(
                                    width: 62,
                                    height: 62,
                                    margin: const EdgeInsets.only(
                                        right: defaultPadding / 2),
                                    child: CircleAvatar(
                                      radius: 56,
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            1), // Border radius
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            width: 62,
                                            height: 62,
                                            imageUrl:
                                                controller.member.user.avater,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: defaultPadding / 2),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.member.user.name,
                                          overflow: TextOverflow.clip,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          const WidgetSpan(
                                              child: Icon(
                                            Icons.add_moderator,
                                            color: Colors.white,
                                            size: 18,
                                          )),
                                          TextSpan(
                                            text:
                                                " ${controller.member.user.packageName}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ])),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: defaultPadding / 2),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 120,
                                child: TextButton(
                                  onPressed: (() =>
                                      controller.onPressSHPointButton()),
                                  style: TextButton.styleFrom(
                                      elevation: 5,
                                      backgroundColor: Colors.white,
                                      primary: primaryColor),
                                  child: controller.isShowPoint
                                      ? RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: SizedBox(
                                                  width: 18,
                                                  height: 18,
                                                  child: Image.asset(
                                                      "assets/icons/gold_coin.png"),
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ${controller.shPoint}',
                                                style: const TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : RichText(
                                          text: const TextSpan(
                                            children: [
                                              WidgetSpan(
                                                  child: Icon(
                                                Icons.touch_app_rounded,
                                                color: primaryColor,
                                                size: 16,
                                              )),
                                              TextSpan(
                                                  text: ' SH POINT',
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${controller.availableDays}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: controller.availableDaysColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: defaultPadding / 3,
                                ),
                                Text(
                                  controller.availableDaysTitle.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: controller.availableDaysColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            );
          });
    });
  }
}

class CustomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 25);

    path.lineTo(size.width * 0.5, size.height);


    path.lineTo(size.width, size.height * 0.85);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 50;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 3, highPoint, size.width / 3, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


/*
// ignore_for_file: file_names, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/bloc/ProfileHomeController.dart';

class AppbarProfileSection extends StatelessWidget {
  const AppbarProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GetBuilder<ProfileHomeController>(
          init: ProfileHomeController(),
          builder: (controller) {
            return Container(
              decoration: const BoxDecoration(),
              child: Stack(children: [
                Opacity(
                  opacity: 0.5,
                  child: ClipPath(
                    clipper: CustomWaveClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        // Colors.purple.shade400,
                        // Colors.purple.shade900
                        Colors.blue,
                        Color.fromARGB(255, 3, 45, 117)
                      ])),
                      height: 140,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: CustomWaveClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      // Colors.purple.shade400,
                      // Colors.purple.shade900
                      Colors.blue,
                      Color.fromARGB(255, 3, 45, 117)
                    ])),
                    height: 138,
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding / 2),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Container(
                                    width: 62,
                                    height: 62,
                                    margin: const EdgeInsets.only(
                                        right: defaultPadding / 2),
                                    child: CircleAvatar(
                                      radius: 56,
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            1), // Border radius
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            width: 62,
                                            height: 62,
                                            imageUrl:
                                                controller.member.user.avater,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: defaultPadding / 2),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.member.user.name,
                                          overflow: TextOverflow.clip,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          const WidgetSpan(
                                              child: Icon(
                                            Icons.add_moderator,
                                            color: Colors.white,
                                            size: 18,
                                          )),
                                          TextSpan(
                                            text:
                                                " ${controller.member.user.packageName}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ])),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: defaultPadding / 2),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 120,
                                child: TextButton(
                                  onPressed: (() =>
                                      controller.onPressSHPointButton()),
                                  style: TextButton.styleFrom(
                                      elevation: 5,
                                      backgroundColor: Colors.white,
                                      primary: primaryColor),
                                  child: controller.isShowPoint
                                      ? RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: SizedBox(
                                                  width: 18,
                                                  height: 18,
                                                  child: Image.asset(
                                                      "assets/icons/gold_coin.png"),
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ${controller.shPoint}',
                                                style: const TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : RichText(
                                          text: const TextSpan(
                                            children: [
                                              WidgetSpan(
                                                  child: Icon(
                                                Icons.touch_app_rounded,
                                                color: primaryColor,
                                                size: 16,
                                              )),
                                              TextSpan(
                                                  text: ' SH POINT',
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${controller.availableDays}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: controller.availableDaysColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: defaultPadding / 3,
                                ),
                                Text(
                                  controller.availableDaysTitle.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: controller.availableDaysColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            );
          });
    });
  }
}

class CustomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 50);

    path.lineTo(size.width * 0.8, size.height);


    path.lineTo(size.width, size.height * 0.85);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 50;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 3, highPoint, size.width / 3, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

 */