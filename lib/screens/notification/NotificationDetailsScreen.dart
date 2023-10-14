// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/notification/models/NotificationModel.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class NotificationDetailsScreen extends StatelessWidget {
  NotificationCustomeModel notification;
  NotificationDetailsScreen({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Notification"),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              notification.message.image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(defaultPadding / 2),
                      child: Image.network(
                        notification.message.image!,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: defaultPadding),
              Text(
                notification.message.title!,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: defaultPadding / 2),
              Text(
                notification.message.body!,
                style: TextStyle(color: Colors.grey.shade900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
