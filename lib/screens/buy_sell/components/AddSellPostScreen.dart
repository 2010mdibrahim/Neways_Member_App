// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/buy_sell/bloc/MySellController.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import './image.dart';

class AddSellPostScreen extends StatelessWidget {
  const AddSellPostScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: const Text('Add Sell Post'), centerTitle: true),
      body: GetBuilder<MySellController>(
          init: MySellController(),
          builder: (controller) {
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView(children: [
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Title",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.title,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter product title",
                      hintStyle:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Category",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
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
                          item.split('-')[0].toString(),
                          style:  TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) =>
                        controller.selectCategory(newValue),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                const Text(
                  "Date",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
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
                          color: Colors.teal,
                          size: 18,
                        ),
                      ),
                      TextSpan(
                          text:
                              ' ${numToMonth("${controller.postedDate.day}/${controller.postedDate.month}/${controller.postedDate.year}")}',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600),)
                    ])),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                const Text(
                  "Posted Location",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.postedLocation,
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter your location",
                      hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600)
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Sell Price",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.price,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter sell price",
                      hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600)
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Condition",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.condition,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter product condition",
                      hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600)
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Brand",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.brand,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter product brand",
                      hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600)
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Model",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.model,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter product model",
                      hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600)
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.phoneNumber,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter phone number",
                      hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600)
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Features",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.features,
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter product features",
                      hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600)
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.description,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter product details",
                      hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.w600)
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
                        "Sell Post Create Successfull",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(8),
                        backgroundColor: Colors.black,
                      );
                    }
                  },
                  child: Text('Create'.toUpperCase()),
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
