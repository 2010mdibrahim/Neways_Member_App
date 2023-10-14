// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';

AppBar buildAppBar(
    {context, required String title, actions, centerTitle = false}) {
  return AppBar(
    backgroundColor: primaryColor,
    elevation: 0,
    titleSpacing: -15,
    centerTitle: centerTitle,
    leading: InkWell(
        onTap: () => Get.back(),
        child: const Icon(Icons.arrow_back_ios, size: 18)),
    title: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
    actions: actions,
  );
}
