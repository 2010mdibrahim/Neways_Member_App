// ignore: non_constant_identifier_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

class CustomeListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String data;
  final bool bottomLine;
  const CustomeListTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.data,
      this.bottomLine = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          color: Colors.white,
          child: Row(
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 18,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  Text(
                    title.toUpperCase(),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  data,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Visibility(
            visible: bottomLine,
            child: Container(height: 1, color: Colors.grey.shade100))
      ],
    );
  }
}
