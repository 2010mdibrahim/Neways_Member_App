import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/HomeScreen.dart';
import 'package:super_home_member/screens/login/bloc/LoginController.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/pre_register/PreRegister.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
        statusBarIconBrightness: Brightness.dark));
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      "assets/images/background.jfif",
                      fit: BoxFit.cover,
                      width: size.width,
                      height: size.height,
                    ),
                  ),
                  Positioned(
                    top: size.height * .2,
                    left: defaultPadding,
                    right: defaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/super-home-logo.png",
                            fit: BoxFit.cover,
                            width: size.width * .35,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                            BorderRadius.circular(defaultPadding / 2),
                          ),
                          child: TextField(
                            controller: controller.cardNumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter Card Number",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                            BorderRadius.circular(defaultPadding / 2),
                          ),
                          child: TextField(
                            controller: controller.password,
                            obscureText: controller.isObscureText,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter your Password",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                              suffixIcon: controller.isObscureText
                                  ? InkWell(
                                onTap: () => controller.setObscureText(),
                                child: Icon(Icons.remove_red_eye_outlined,
                                    color: Colors.grey.shade400),
                              )
                                  : InkWell(
                                onTap: () => controller.setObscureText(),
                                child: const Icon(
                                  Icons.remove_red_eye,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () async {
                              if (!controller.isLoading) {
                                var status = await controller.login();
                                await EasyLoading.show(status: 'login...');

                                if (status == true) {
                                  await EasyLoading.dismiss();
                                  Get.snackbar(
                                      'Success', "Account Login Successfully",
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Colors.white,
                                      margin: const EdgeInsets.all(8),
                                      backgroundColor:
                                      Color.fromRGBO(0, 0, 0, 1));
                                  Get.offAll(HomeScreen());
                                } else {
                                  await EasyLoading.dismiss();
                                  Get.snackbar('Error', controller.error,
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Colors.white,
                                      margin: const EdgeInsets.all(8),
                                      backgroundColor: Colors.red.shade500);
                                }
                              }
                            },
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.teal[300],
                            ),
                            child: Text("Login".toUpperCase()
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Checkbox(
                                      activeColor: Colors.teal,
                                      value: controller.isRemember,
                                      onChanged: (value) =>
                                          controller.setRemember(value),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    " Remember Me",
                                    style: TextStyle(
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () => Get.to(PreRegister()),
                              child: const Text(
                                "Pre Register for New User",
                                style: TextStyle(
                                  color: Colors.teal,
                                    fontSize: 13,
                                    decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w800
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}




/// ruf->new
/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/HomeScreen.dart';
import 'package:super_home_member/screens/login/bloc/LoginController.dart';
import 'package:mac_address/mac_address.dart';
import 'package:super_home_member/screens/pre_register/PreRegister.dart';

import '../widgets/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  String _platformVersion = 'Unknown';
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }




  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }


    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });

    box.write(checkDevice, _platformVersion.toString());

  }


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
        statusBarIconBrightness: Brightness.dark));
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      "assets/images/background.jfif",
                      fit: BoxFit.cover,
                      width: size.width,
                      height: size.height,
                    ),
                  ),
                  Positioned(
                    top: size.height * .2,
                    left: defaultPadding,
                    right: defaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/super-home-logo.png",
                            fit: BoxFit.cover,
                            width: size.width * .35,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 2),
                          ),
                          child: TextField(
                            controller: controller.cardNumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter Card Number",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 2),
                          ),
                          child: TextField(
                            controller: controller.password,
                            obscureText: controller.isObscureText,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter your Password",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14,),
                              suffixIcon: controller.isObscureText
                                  ? InkWell(
                                      onTap: () => controller.setObscureText(),
                                      child: Icon(Icons.remove_red_eye_outlined,
                                          color: Colors.grey.shade400),
                                    )
                                  : InkWell(
                                      onTap: () => controller.setObscureText(),
                                      child: const Icon(
                                        Icons.remove_red_eye,
                                        color: primaryColor,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () async {
                                  Get.offAll(HomeScreen());
                                },
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: primaryColor,
                            ),
                            child: Text("Login".toUpperCase()),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Checkbox(
                                      activeColor: primaryColor,
                                      value: controller.isRemember,
                                      onChanged: (value) =>
                                          controller.setRemember(value),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    " Remember Me",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.normal),
                              ),
                            )

                          ],
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () => Get.to(const PreRegister()),
                              child: const Text(
                                "Pre Register for New User",
                                style: TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.underline),
                              ),
                          ),
                        ),

                        const SizedBox(height: 25,),


                        /*
                        Align(
                          alignment: Alignment.center,
                          child:  Text(
                            box.read(checkDevice),
                              //_platformVersion,
                            style:  const TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                         */


                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

*/

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/HomeScreen.dart';
import 'package:super_home_member/screens/login/bloc/LoginController.dart';
import 'package:mac_address/mac_address.dart';
import 'package:super_home_member/screens/pre_register/PreRegister.dart';

import '../widgets/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  String _platformVersion = 'Unknown';
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }


  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }
    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
    box.write(checkDevice, _platformVersion.toString());
  }


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
        statusBarIconBrightness: Brightness.dark));
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      "assets/images/background.jfif",
                      fit: BoxFit.cover,
                      width: size.width,
                      height: size.height,
                    ),
                  ),
                  Positioned(
                    top: size.height * .2,
                    left: defaultPadding,
                    right: defaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/super-home-logo.png",
                            fit: BoxFit.cover,
                            width: size.width * .35,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 2),
                          ),
                          child: TextField(
                            controller: controller.cardNumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter Card Number",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 2),
                          ),
                          child: TextField(
                            controller: controller.password,
                            obscureText: controller.isObscureText,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter your Password",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14,),
                              suffixIcon: controller.isObscureText
                                  ? InkWell(
                                      onTap: () => controller.setObscureText(),
                                      child: Icon(Icons.remove_red_eye_outlined,
                                          color: Colors.grey.shade400),
                                    )
                                  : InkWell(
                                      onTap: () => controller.setObscureText(),
                                      child: const Icon(
                                        Icons.remove_red_eye,
                                        color: primaryColor,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () async {
                              if (!controller.isLoading && (box.read(checkEmail)==true)){
                                ///==box.read(checkDevice))
                                var status = await controller.login();
                                await EasyLoading.show(status: 'login...');

                                if (status == true ) {
                                  await EasyLoading.dismiss();
                                  Get.snackbar(
                                      'Success', "Account Login Successfully",
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Colors.white,
                                      margin: const EdgeInsets.all(8),
                                      backgroundColor:
                                          const Color.fromRGBO(0, 0, 0, 1),
                                  );
                                  Get.offAll(HomeScreen());
                                }
                                else {
                                  await EasyLoading.dismiss();
                                  Get.snackbar('Error', controller.error,
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Colors.white,
                                      margin: const EdgeInsets.all(8),
                                      backgroundColor: Colors.red.shade500);
                                }

                              }
                            },
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: primaryColor,
                            ),
                            child: Text("Login".toUpperCase()),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Checkbox(
                                      activeColor: primaryColor,
                                      value: controller.isRemember,
                                      onChanged: (value) =>
                                          controller.setRemember(value),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    " Remember Me",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.normal),
                              ),
                            )

                          ],
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () => Get.to( PreRegister()),
                              child: const Text(
                                "Pre Register for New User",
                                style: TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.underline),
                              ),
                          ),
                        ),

                        const SizedBox(height: 25,),



                        /*
                        Align(
                          alignment: Alignment.center,
                          child:  Text(
                            box.read(checkDevice),
                              //_platformVersion,
                            style:  const TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                         */


                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}


*/

// ignore_for_file: file_names

