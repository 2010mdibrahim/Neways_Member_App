// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

class BookingReceptTableData extends StatelessWidget {
  const BookingReceptTableData({
    Key? key,
    required this.title,
    required this.type,
    required this.unitPrice,
    required this.total,
  }) : super(key: key);
  final String title;
  final String type;
  final String unitPrice;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPaddingEdge,
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.1),
          border: const Border(bottom: BorderSide(color: Colors.white))),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                  fontSize: 11),
            ),
          ),
          Expanded(
            child: Text(
              type,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade800, fontSize: 11),
            ),
          ),
          Expanded(
            child: Text(
              unitPrice,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.grey.shade800, fontSize: 11),
            ),
          ),
          Expanded(
            child: Text(
              total,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
