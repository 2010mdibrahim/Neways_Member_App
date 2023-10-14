// ignore_for_file: avoid_print, file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/auth/bloc/AuthController.dart';
import 'package:super_home_member/screens/login/models/login_request.dart';
import 'package:super_home_member/screens/login/models/login_respones.dart';
import 'package:super_home_member/screens/login/services/login_api_service.dart';

class LoginController extends GetxController {
  String error = '';
  TextEditingController cardNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  final box = GetStorage();
  bool isLoading = false;
  bool isRemember = false;
  bool ckDevice =false;
  bool isObscureText = true;

  @override
  onInit() {
    super.onInit();
    isRemember = box.read('isRemember') ?? false;
    if (isRemember) {
      cardNumber.text = box.read('cardNumber') ?? '';
    }
  }

  setRemember(value) {
    isRemember = value;
    update();
  }

  setObscureText() {
    isObscureText = !isObscureText;
    update();
  }

  login() async {
    if (cardNumber.text.isEmpty) {
      error = "Card number must be required";
      return false;
    }
    if (password.text.isEmpty) {
      error = "Password must be required";
      return false;
    }
    isLoading = true;
    var response = await LoginAPIService.login(LoginRequest(
      cardNumber: cardNumber.text,
      password: password.text,
      deviceId: box.read('device_token'),
    ));
    if (response.runtimeType == LoginResponse) {
      LoginResponse member = response;
      box.write('login', true);
      box.write('token', member.token);
      box.write('id', member.user.id);
      box.write('name', member.user.name);
      box.write('packageName', member.user.packageName);
      box.write('branchName', member.user.branchName);
      box.write('bookingId', member.user.bookingId);
      box.write('cardNumber', member.user.cardNumber);
      box.write('avater', member.user.avater);
      box.write('isRemember', isRemember);

      print(member.user.bookingId);
    } else {
      if (response != null) {
        print(response['error']);
        error = response['error'];
      } else {
        error = "Server Error! Please Try Again";
      }
      isLoading = false;
      update();
      return false;
    }
    isLoading = false;
    authController.getCheckLogin();
    update();
    return true;
  }
}
