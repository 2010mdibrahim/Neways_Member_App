// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../bloc/CardChangeRequestController.dart';

class CardChangeRequestScreen extends StatelessWidget {
  const CardChangeRequestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.cyan[600],
        title: const Text('Request'),centerTitle: true,
      ),
      body: GetBuilder<CardChangeRequestController>(
          init: CardChangeRequestController(),
          builder: (controller) {
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView(children: [
                const SizedBox(height: defaultPadding),
                Text(
                  "Card Change Request".toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700),
                ),
                const Divider(color: Colors.white, thickness: 3),
                Text(
                  "Request Date",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700,fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: defaultPadding / 2),
                InkWell(
                  onTap: () async {
                    await controller.pickDate(context);
                  },
                  child: Container(
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
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade700,fontWeight: FontWeight.w800),)
                    ])),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Reason",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700,fontWeight: FontWeight.w800),
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
                      hintText: "Enter details reason",
                      hintStyle:
                      TextStyle(fontSize: 13, color: Colors.grey.shade700,fontWeight: FontWeight.w700),
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
                        "Card Change Request Submit Successfull",
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
                )
              ]),
            );
          }),
    );
  }
}
