/// controller.logout(); comment out

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/auth/bloc/AuthController.dart';
import 'package:super_home_member/screens/home/components/HomeBody.dart';
import 'package:super_home_member/screens/notification/NotificationScreen.dart';
import 'package:super_home_member/screens/qrcode/bloc/QRCodeController.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
        statusBarIconBrightness: Brightness.dark));
    controller.getCheckVersion(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 35,
        elevation: 0,
        title: Text("Super Hostel".toUpperCase(),style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              // Colors.purple.shade400,
              // Colors.purple.shade900
              Colors.blue,
              Color.fromARGB(255, 3, 45, 117)
              // Color.fromARGB(255, 30, 30, 100)
            ]),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.snackbar(
                    'Employee Review', "Scan Neways Employee or Staff ID Card",
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding));
                Get.put(QRCodeController()).scanQR();
                // Get.to(QRCodeScreen());
              },
              icon: const Icon(
                Icons.qr_code_scanner_rounded,
                color: Colors.white,
              )
          ),
          IconButton(
              onPressed: () => Get.to(const NotificationScreen()),
              // onPressed: (() => timeDuration()),
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
              )
          ),
          GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) {
                return Visibility(
                  visible: controller.isLogin,
                  child: IconButton(
                      onPressed: () => Get.defaultDialog(
                            radius: 5,
                            title: "Logout",
                            content:const Padding(
                              padding: EdgeInsets.fromLTRB(20,0,0,0),
                              child: Text(
                                  "Are you sure? Do you want to Logout?"
                              ),
                            ),
                            confirm: TextButton(
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.green),
                                onPressed: () {
                                  Get.back();
                                  controller.logout();
                                },
                                child: const Text("Yes")
                            ),
                            cancel: TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.red),
                              onPressed: () => Get.back(),
                              child: const Text("No"),
                            ),
                          ),
                      icon: const Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.white,
                      )
                  ),
                );
              }
              ),
        ],
      ),
      body: SafeArea(
        child: HomeBody(),
      ),
    );
  }
}
