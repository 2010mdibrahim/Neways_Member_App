// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class CancelRequestController extends GetxController {
  DateTime date = DateTime.now();
  DateTime month = DateTime.now();
  TextEditingController note = TextEditingController();
  bool isBank = false;
  bool isBkash = false;
  bool isPersonal = false;

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

  pickMonth(BuildContext context, {DateTime? initialDate}) {
    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: date,
      locale: const Locale("en"),
    ).then((newDate) {
      if (newDate != null) {
        month = newDate;
        update();
      }
    });
  }

  checkBankStatus(value) {
    isBank = value;
    if (value) {
      isBkash = false;
    }
    update();
  }

  checkBkashStatus(value) {
    isBkash = value;
    if (value) {
      isBank = false;
    }
    update();
  }

  checkIsPersonalStatus(value) {
    isPersonal = value;

    update();
  }
}
