// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

class DocumentList extends StatelessWidget {
  final String label;
  VoidCallback onPress;
  DocumentList({Key? key, required this.label, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label.toUpperCase(),
                style: TextStyle(color: Colors.grey.shade600),
              ),
              TextButton(onPressed: onPress, child: const Text("View Document"))
            ],
          ),
        ),
        Container(height: 1, color: Colors.grey.shade100)
      ],
    );
  }
}
