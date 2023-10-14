// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/request/leave/bloc/LeaveController.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class LeaveReasonScreen extends StatelessWidget {
  const LeaveReasonScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight: 35,
          title: const Text('Request For Cancel'), centerTitle: true),
      body: GetBuilder<LeaveController>(
          init: LeaveController(),
          builder: (controller) {
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView(children: [
                const SizedBox(height: defaultPadding),
                Text(
                  "Category",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700,fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: DropdownButton(
                    // Initial Value
                    value: controller.selectedCategory,
                    alignment: Alignment.center, isExpanded: true,
                    underline: Container(),

                    // Array list of items
                    items: controller.categorieNames.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.split('-')[0],
                          style:  TextStyle(fontSize: 13, color: Colors.grey.shade700,fontWeight: FontWeight.w700)
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) =>
                        controller.selectCategory(newValue),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Leave reason",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700,fontWeight: FontWeight.w800)
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
                    maxLines: 5,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Please write as much as details",
                      hintStyle:
                          TextStyle(color: Colors.grey.shade600, fontSize: 14),
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
                        "Leave Reason Submit Successfull",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(8),
                        backgroundColor: Colors.black,
                      );
                    }
                  },
                  child: Text('Request Submit'.toUpperCase(),style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w800),),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.teal[300],
                      primary: Colors.white,
                      padding: const EdgeInsets.all(defaultPadding)),
                ),
              ]),
            );
          }),
    );
  }
}
