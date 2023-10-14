import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/get_started/GetStartedScreen.dart';

class IntroScreen extends StatelessWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle:
        const PageDecoration().titleTextStyle.copyWith(color: primaryColor),
    bodyTextStyle: const PageDecoration()
        .bodyTextStyle
        .copyWith(color: primaryColor, fontSize: 10),
    bodyPadding: const EdgeInsets.all(10),
  );

  IntroScreen({Key? key}) : super(key: key);

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Container(
          margin: const EdgeInsets.only(left: 0),
          child: Image.asset("assets/intro/1.png", fit: BoxFit.cover),
        ),
        title: "Luxarious Lobby",
        bodyWidget: const Text(
          "We have Luxurious Lobby for super home member",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w800),
        ),
        // footer: Container(
        //   alignment: Alignment.center,
        //   width: 80,
        //   child: Image.asset(
        //     "assets/images/super-home-logo.png",
        //     fit: BoxFit.cover,
        //   ),
        // ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("assets/intro/2.png"),
        title: "Reading Room",
        bodyWidget: const Text(
          "Providing you the best environment in the Reading Room.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w800),
        ),
        // footer: Container(
        //   alignment: Alignment.center,
        //   width: 80,
        //   child: Image.asset(
        //     "assets/images/super-home-logo.png",
        //     fit: BoxFit.cover,
        //   ),
        // ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("assets/intro/3.png"),
        title: "3 Times Meal",
        bodyWidget: const Text(
          "We are providing three times meals every day. We have the best Chef.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w800),
        ),
        // footer: Container(
        //   alignment: Alignment.center,
        //   width: 80,
        //   child: Image.asset(
        //     "assets/images/super-home-logo.png",
        //     fit: BoxFit.cover,
        //   ),
        // ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("assets/intro/4.png"),
        title: "Gym",
        bodyWidget: const Text(
          "We are provider free Gym facilities",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w800),
        ),
        // footer: Container(
        //   alignment: Alignment.center,
        //   width: 80,
        //   child: Image.asset(
        //     "assets/images/super-home-logo.png",
        //     fit: BoxFit.cover,
        //   ),
        // ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("assets/intro/5.png"),
        title: "Playing Zone ",
        bodyWidget: const Text(
          "We have playing zones.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w800),
        ),
        decoration: pageDecoration,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),

        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: primaryColor,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            )
        ),
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        onSkip: () async {
          GetStorage().write('firstInstall', true);
          Get.offAll(const GetStartedScreen());
        },
        next: const Icon(Icons.arrow_forward, color: primaryColor),
        done: const Text(
          "Done",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        onDone: () async {
          GetStorage().write('firstInstall', true);
          Get.offAll(const GetStartedScreen());
        },
      ),
    );
  }
}
