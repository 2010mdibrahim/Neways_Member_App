// ignore_for_file: file_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/notification/NotificationDetailsScreen.dart';
import 'package:super_home_member/screens/notification/bloc/NotificationController.dart';
import 'package:super_home_member/screens/notification/models/NotificationModel.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Notification"),
      body: GetBuilder<NotificationController>(
          init: NotificationController(),
          builder: (controller) {
            if (controller.isLoading) {
              return Container();
            }
            if (controller.notifications.isNotEmpty) {
              return Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  itemCount: controller.notifications.length,
                  reverse: true,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    NotificationCustomeModel notification =
                        controller.notifications[index];
                    // return Text('${notification.message.title}');
                    return ListTile(
                      leading: Builder(builder: (context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            "${notification.message.image}",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      }),
                      title: Text('${notification.message.title}'),
                      subtitle: Text(
                        '${notification.message.body}',
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: (() => Get.to(NotificationDetailsScreen(
                          notification: notification))),
                      onLongPress: (() => Get.defaultDialog(
                            radius: 5,
                            title: "Delete",
                            content: const Text(
                              "Are you sure? Do you want to Delete this Notification?",
                              textAlign: TextAlign.center,
                            ),
                            confirm: TextButton(
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.green),
                                onPressed: () {
                                  Get.back();
                                  controller.delete(notification);
                                },
                                child: const Text("Yes")),
                            cancel: TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.red),
                              onPressed: () => Get.back(),
                              child: const Text("No"),
                            ),
                          )),
                    );
                  },
                ),
              );
            }
            return Center(
              child: Container(
                child: RichText(
                    text: TextSpan(children: [
                  const WidgetSpan(
                      child: Icon(Icons.notification_important,
                          size: 18, color: Colors.red)),
                  TextSpan(
                      text: "  Empty Notification Box".toUpperCase(),
                      style: const TextStyle(color: Colors.red)),
                ])),
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(defaultPadding),
                ),
              ),
            );
          }),
    );
  }
}
