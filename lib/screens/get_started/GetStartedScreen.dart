// ignore_for_file: file_names

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/home/HomeScreen.dart';
import 'package:super_home_member/screens/login/LoginScreen.dart';
import 'package:super_home_member/screens/pre_register/PreRegister.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: defaultPaddingEdge,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      // const SizedBox(height: defaultPadding * 0.5),
                      Text(
                        "Super Hostel innovation for bachelor",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  color: Colors.grey.shade400,
                                  offset: const Offset(3, 3)),
                            ],),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset("assets/images/getstarted.png",
                  width: MediaQuery.of(context).size.width * 0.75),
              Expanded(child: Container()),
              TextButton(
                  onPressed: () => Get.offAll(HomeScreen()),
                  child: Text("Continue as a Guest".toUpperCase(),style: const TextStyle(
                    //color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),),),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: TextButton(
                  onPressed: () => Get.to(const LoginScreen()),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    primary: primaryColor,
                    side: const BorderSide(color: Colors.teal),
                  ),
                  child: Text("LogIn".toUpperCase(),style: TextStyle(fontSize: 15,color: Colors.cyan[600],fontWeight: FontWeight.w800),),
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: TextButton(
                  onPressed: () => Get.to(PreRegister()),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.teal[300],
                    primary: Colors.white,
                  ),
                  child: Text("Pre Register".toUpperCase(),style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w800),),
                ),
              ),
              const SizedBox(height: defaultPadding),
              const Text(
                "By proceeding you agree to our",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: defaultPadding / 6),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: InkWell(
                        onTap: () =>
                            launchInWebViewOrVC(path: '/temrs-and-condition'),
                        child: const Text(
                          "Terms & Conditions",
                          style: TextStyle(fontSize: 12, color: primaryColor),
                        ),
                      ),
                    ),
                    const TextSpan(
                      text: " and ",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    WidgetSpan(
                      child: InkWell(
                        onTap: () =>
                            launchInWebViewOrVC(path: '/privacy-policy'),
                        child: const Text(
                          "Privacy Policy",
                          style: TextStyle(fontSize: 12, color: primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }

  void notify() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'channelKey1',
          title: "This is Notification title",
          body: "This is Body of notification",
          bigPicture:
              "https://i.pinimg.com/736x/0b/c1/94/0bc19452b7a568797c8331be7275e453.jpg",
          notificationLayout: NotificationLayout.BigPicture),
    );
    // AwesomeNotifications().actionStream.listen((event) {
    //   Get.to(const NotificationScreen());
    // });
  }
}
