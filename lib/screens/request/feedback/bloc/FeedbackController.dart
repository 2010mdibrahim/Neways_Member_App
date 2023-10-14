// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/request/feedback/models/feed_back_response.dart';
import 'package:super_home_member/screens/request/feedback/services/feedback_api_service.dart';

class FeedbackController extends GetxController {
  DateTime date = DateTime.now();
  TextEditingController note = TextEditingController();
  final box = GetStorage();

  submit() async {
    if (note.text.isEmpty) {
      Get.snackbar(
        'Wrong',
        "Requested package field must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    await FeedbackAPIService.submit(
        data: FeedbackResponce(
      cardNumber: box.read('cardNumber'),
      note: note.text,
      date: "${date.day}/${date.month}/${date.year}",
    ));

    EasyLoading.dismiss();
    return true;
  }
}
