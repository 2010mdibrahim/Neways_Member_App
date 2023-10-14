// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/request/food_request/bloc/FoodRequestController.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class MealRequestScreen extends StatelessWidget {
  const MealRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: const Text("Request Meal"),centerTitle: true,),
      body: GetBuilder<FoodRequestController>(
          init: FoodRequestController(),
          builder: (controller) {
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView(children: [
                Text(
                  "Request Date",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700,fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: RichText(
                      text: TextSpan(children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.cyan,
                        size: 18,
                      ),
                    ),
                    TextSpan(
                        text:
                            ' ${numToMonth("${controller.date.day}/${controller.date.month}/${controller.date.year}")}',
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 14,fontWeight: FontWeight.w700))
                  ])),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Meal type",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700,fontWeight: FontWeight.w700)
                ),
                // const SizedBox(height: defaultPadding / 2),
                Row(
                  children: [
                    Checkbox(
                        value: controller.isBreakfast,
                        onChanged: (value) => controller.checkBreakfast(value)),
                    const Text("Breakfast",style: TextStyle(fontWeight: FontWeight.w700),)
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: controller.isLunch,
                        onChanged: (value) => controller.checkLunch(value)),
                    const Text("Lunch",style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: controller.isDinner,
                        onChanged: (value) => controller.checkDinner(value)),
                    const Text("Dinner",style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Note",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700,fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.note,
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter details note",
                      hintStyle:
                          TextStyle(color: Colors.grey.shade600, fontSize: 14,fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                TextButton(
                  onPressed: () async {
                    await EasyLoading.show(status: "Uploding...");
                    var status = await controller.submit();
                    if (status == true) {
                      Get.back();
                      Get.snackbar(
                        'Success',
                        "Meal Request Submit Successfull",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(8),
                        backgroundColor: Colors.black,
                      );
                    }
                  },
                  child: Text('Request Submit'.toUpperCase(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.teal[300],
                      primary: Colors.white,
                      padding: const EdgeInsets.all(defaultPadding)),
                )
              ]),
            );
          }),
    );
  }
}
