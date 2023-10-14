// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/splash/bloc/SplashController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: bodyColor, statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    child: Image.asset(
                      "assets/images/super-home-logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: defaultPadding,
                  child: GifView.asset(
                    'assets/gif/loading.gif',
                    height: 80,
                    width: 80,
                    frameRate: 30, // default is 15 FPS
                  ),
                )
              ],
            );
          }
          ),
    );
  }
}
