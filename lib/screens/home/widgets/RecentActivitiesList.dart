// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

// ignore: must_be_immutable
class RecentActivitiesList extends StatelessWidget {
  RecentActivitiesList({
    required this.onPress,
    required this.title,
    Key? key,
  }) : super(key: key);
  VoidCallback onPress;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.check_box_outlined,
                color: primaryColor,
                size: 18,
              ),
              const SizedBox(width: defaultPadding / 4),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
