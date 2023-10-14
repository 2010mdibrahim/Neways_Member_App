// ignore: non_constant_identifier_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

class BookingListTile extends StatelessWidget {
  final String title;
  final String data;
  final bool bottomLine;
  const BookingListTile(
      {Key? key,
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
              Text(
                title.toUpperCase(),
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Expanded(
                child: Text(
                  data,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.grey.shade800, fontWeight: FontWeight.bold,fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Visibility(
            visible: bottomLine,
            child: Container(height: 2, color: Colors.grey.shade100))
      ],
    );
  }
}
