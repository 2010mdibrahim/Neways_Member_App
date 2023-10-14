// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/request/complain/bloc/ComplainController.dart';
import 'package:super_home_member/screens/request/complain/components/image.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class ComplainScreen extends StatelessWidget {
  const ComplainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: Text('Request'),centerTitle: true,),
      body: GetBuilder<ComplainController>(
          init: ComplainController(),
          builder: (controller) {
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView(children: [
                const SizedBox(height: defaultPadding),
                Text(
                  "Complaint Submission".toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                  ),
                ),
                const Divider(color: Colors.white, thickness: 2),
                const SizedBox(height: defaultPadding / 2),
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
                  "Complaint details",
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
                const SizedBox(height: defaultPadding / 2),
                ImageUpload(),
                const SizedBox(height: defaultPadding),
                TextButton(
                  onPressed: () async {
                    await EasyLoading.show(status: "Uploding...");
                    var status = await controller.submit();
                    if (status == true) {
                      Get.back();
                      Get.snackbar(
                        'Success',
                        "Complaint Request Submit Successfull",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(8),
                        backgroundColor: Colors.black,
                      );
                    }
                  },
                  child: Text('Request Submit'.toUpperCase(),style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w800),),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.cyan[600],
                      primary: Colors.white,
                      padding: const EdgeInsets.all(defaultPadding)),
                ),
              ]),
            );
          }),
    );
  }
}
