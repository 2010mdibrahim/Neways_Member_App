// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/request/card/models/card_change_response.dart';

import '../models/card_change_request.dart';
import '../services/card_api_service.dart';

class CardChangeRequestController extends GetxController {
  DateTime date = DateTime.now();
  TextEditingController note = TextEditingController();
  final box = GetStorage();
  List<CardChangeResponce> cards = [];
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    getCads();
  }

  getCads() async {
    isLoading = true;
    await EasyLoading.show();
    await CardAPIService.getRequestedCard().then((value) {
      if (value.runtimeType == List<CardChangeResponce>) {
        cards = value;
      } else {}
    });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }

  submit() async {
    if (note.text.isEmpty) {
      Get.snackbar(
        'Wrong',
        "Reason field must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    await CardAPIService.submit(
        data: CardChangeRequest(
      cardNumber: box.read('cardNumber'),
      note: note.text,
      status: false,
      date: "${date.day}/${date.month}/${date.year}",
    ));
    await getCads();

    EasyLoading.dismiss();
    return true;
  }

  delete(id) async {
    await EasyLoading.show();
    await CardAPIService.delete(id: id);
    await EasyLoading.dismiss();
    Get.snackbar(
      'Success',
      "Card Change Request Delete Successfull",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(8),
      backgroundColor: Colors.black,
    );
    await getCads();
    update();
    return true;
  }

  Future pickDate(BuildContext context, {DateTime? initialDate}) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      // firstDate: DateTime.now().subtract(const Duration(days: 0)),
      firstDate: DateTime(DateTime.now().year - (DateTime.now().year - 2000)),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (newDate == null) return;
    // return '${date.day}/${date.month}/${date.year}';
    date = newDate;
    update();
    return newDate;
  }
}
