// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../bloc/BranchChangeController.dart';

class BranchChangeRequestScreen extends StatelessWidget {
  const BranchChangeRequestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight: 35,
          title: Text('Request'),centerTitle: true,
      ),
      body: GetBuilder<BranchChangeController>(
          init: BranchChangeController(),
          builder: (controller) {
            if (controller.isLoading) {
              return Container();
            }
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView(children: [
                const SizedBox(height: defaultPadding),
                Text(
                  "Branch Change Request".toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700),
                ),
                const Divider(
                    color: Colors.white, thickness: 3, height: defaultPadding),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Current Branch",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700,fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextFormField(
                    initialValue: controller.currentBranche.name,
                    // readOnly: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter current branch name",
                      hintStyle:
                      TextStyle(fontSize: 13, color: Colors.grey.shade700,fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Super Home Branches",
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
                    value: controller.selectedBranch,
                    alignment: Alignment.center, isExpanded: true,
                    underline: Container(),

                    // Array list of items
                    items: controller.branches.map((item) {
                      return DropdownMenuItem(
                        value: item.name,
                        child: Text(item.name,style: TextStyle(fontSize: 13, color: Colors.grey.shade700,fontWeight: FontWeight.w700),),
                      );
                    }).toList(),
                    onChanged: (newValue) => controller.selectBranch(newValue),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
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
                          style: TextStyle(fontSize: 13, color: Colors.grey.shade700,fontWeight: FontWeight.w700),
                      )
                    ])
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Note",
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
                      hintText: "Enter note details",
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
                        "Branch Change Request Submit Successfull",
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
