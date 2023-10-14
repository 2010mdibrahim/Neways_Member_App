// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/get_started/GetStartedScreen.dart';
import 'package:super_home_member/screens/home/HomeScreen.dart';
import 'package:super_home_member/services/httpClient.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  late bool isLogin;
  // late BuildContext context;

  @override
  void onInit() {
    super.onInit();
    getCheckLogin();
    Future.delayed(const Duration(seconds: 5), () => popUpAds());
    // getCheckVersion();
    // popUpAds();
  }

  getCheckLogin() {
    isLogin = box.read('login') ?? false;
    if (isLogin) {
      getCheckoutStatus();
    }
    update();
  }

  logout() {
    box.write('login', false);
    box.write('token', null);
    isLogin = false;
    Get.snackbar(
      'Success',
      "Account logout successfully",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(8),
      backgroundColor: Colors.black,
    );
    update();
    Get.offAll(HomeScreen());
  }

  popUpAds() {
    if (box.read('popup') == true) {
      Get.dialog(
          Stack(
            alignment: Alignment.center,
            children: [


              Padding(
                padding: defaultPaddingEdge,
                child: InkWell(
                  onTap: () async => _launchUrl(),
                  child: CachedNetworkImage(
                    imageUrl: box.read('popup_img'),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),

              Positioned(
                  right: 10,
                  top: 10,
                  child: IconButton(
                      color: Colors.black,
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.white,
                      )
                  )
              )

            ],
          ),
          barrierColor: Colors.black12.withOpacity(0.8),
          useSafeArea: true);
      box.write('popup', false);
    }
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(box.read('popup_link'));
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  getCheckVersion(context) async {
    try {
      final newVersion = NewVersionPlus(
          androidId: "com.superhostelbd.member"); // com.superhomebd.member

      final status = await newVersion.getVersionStatus();

      if (status!.localVersion != status.storeVersion) {
        newVersion.showUpdateDialog(
            context: context,
            versionStatus: status,
            dialogTitle: "Update For Better Experience");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getCheckoutStatus() async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };

    try {
      var response = await _http.post('/checkout_status');
      if (response.statusCode == 200) {
        if (response.data['status']) {
          box.write('login', false);
          box.write('token', null);
          isLogin = false;
          Get.off(const GetStartedScreen());
          update();
        }
      } else {
        box.write('login', false);
        box.write('token', null);
        isLogin = false;
        Get.off(const GetStartedScreen());
        update();
      }
    } on DioError catch (e) {
      print(e);
      // box.write('login', false);
      // box.write('token', null);
      // isLogin = false;
      // Get.off(const GetStartedScreen());
      // update();
    }
  }
}
