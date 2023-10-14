// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/food_menu/models/food_menu_response.dart';
import 'package:super_home_member/screens/food_menu/services/food_menu_api_service.dart';
import 'package:super_home_member/screens/request/branch/models/branch_responce.dart';

class FoodMenuController extends GetxController {
  FoodMenuResponse menu = FoodMenuResponse();
  // bool isLoading = false;
  final box = GetStorage();
  DateTime date = DateTime.now();
  @override
  onInit() async {
    super.onInit();
    await getAllFoodMenu();
  }

  getAllFoodMenu() async {
    // await EasyLoading.show();
    // isLoading = true;
    await FoodMenuAPIService.getCurrentBranch().then((branch) async {
      if (branch.runtimeType == BranchResponse) {
        menu = await FoodMenuAPIService.getAllMenu(data: {
          "branch_name": branch.name,
          "time": (date.millisecondsSinceEpoch / 1000).toString(),
          "day": "Sunday",
        }).then((value) {
          // isLoading = false;
          return value;
        });
      } else {}
    });
    // await EasyLoading.dismiss();
    update();
  }

  Future pickDate(BuildContext context, {DateTime? initialDate}) async {

    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      // firstDate: DateTime.now().subtract(const Duration(days: 0)),
      firstDate: DateTime(DateTime.now().year - (DateTime.now().year - 2000)),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (newDate == null) {
      date = newDate!;
      await getAllFoodMenu();
      update();
      return newDate;
    }
    // return '${date.day}/${date.month}/${date.year}';
  }


}
