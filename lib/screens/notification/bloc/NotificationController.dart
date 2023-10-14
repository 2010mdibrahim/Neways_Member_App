import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/notification/models/NotificationModel.dart';

class NotificationController extends GetxController {
  List<NotificationCustomeModel> notifications = [];
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    getAllNotifications();
  }

  getAllNotifications() async {
    isLoading = true;
    EasyLoading.show();
    Box box = await openBox('notifications');
    var data = box.toMap().values.toList();
    notifications.clear();
    for (var notification in data) {
      notifications.add(NotificationCustomeModel.fromJson(notification));
    }
    isLoading = false;
    EasyLoading.dismiss();
    update();
  }

  delete(notification) async {
    Box box = await openBox('notifications');
    int index = notifications.indexOf(notification);
    box.deleteAt(index);
    getAllNotifications();
    update();
  }
}
