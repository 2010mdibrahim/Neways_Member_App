// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../bloc/PackageChangeController.dart';

class PackageChangeRequestScreen extends StatelessWidget {
  const PackageChangeRequestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight: 35,
          title: Text('Request'),centerTitle: true,),
      body: GetBuilder<PackageChangeController>(
          init: PackageChangeController(),
          builder: (controller) {
            if (controller.isLoading) {
              return Container();
            }
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView(children: [
                const SizedBox(height: defaultPadding),
                Text(
                  "Package Change Request".toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700),
                ),
                const Divider(
                    color: Colors.white, thickness: 3, height: defaultPadding
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Current Package",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700,fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextFormField(
                    initialValue:
                        "${controller.currentPackage.packageName} (${controller.currentPackage.packageCategoryName})",
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter current package name",
                      hintStyle:
                      TextStyle(fontSize: 13, color: Colors.grey.shade700,fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Super Home Package",
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
                    value: controller.selectedPackageName,
                    alignment: Alignment.center, isExpanded: true,
                    underline: Container(),

                    // Array list of items
                    items: controller.packageNames.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item.split('-')[0],style: TextStyle(fontSize: 13, color: Colors.grey.shade700,fontWeight: FontWeight.w700),),
                      );
                    }).toList(),
                    onChanged: (newValue) =>
                        controller.selectPackage(newValue.toString()),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Visibility(
                  visible: controller.isSelectPackage,
                  child: Container(
                      padding: defaultPaddingEdge,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              BorderRadius.circular(defaultPadding / 2)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Package Name",
                                      style: TextStyle(
                                          color: Colors.grey.shade800),
                                    ),
                                    Text(
                                      controller.selectedPackage.packageName
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Package Category",
                                      style: TextStyle(
                                          color: Colors.grey.shade800),
                                    ),
                                    Text(
                                      controller
                                          .selectedPackage.packageCategoryName
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Package Price",
                                    style:
                                        TextStyle(color: Colors.grey.shade800),
                                  ),
                                  Text(
                                    "BDT ${controller.selectedPackage.packagePrice}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Monthly Rent",
                                    style:
                                        TextStyle(color: Colors.grey.shade700),
                                  ),
                                  Text(
                                    "BDT ${controller.selectedPackage.monthlyRent}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
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
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade700,fontWeight: FontWeight.w800),)
                    ])),
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
                        "Package Change Request Submit Successfull",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(8),
                        backgroundColor: Colors.black,
                      );
                    }
                  },
                  child: Text('Request Submit'.toUpperCase(),style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w800),),
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
