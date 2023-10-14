// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

import '../widgets/BookingReceptTableData.dart';

class BookingReceptTable extends StatelessWidget {
  const BookingReceptTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: defaultPaddingEdge,
          color: primaryColor.withOpacity(0.25),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "#".toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Type".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Unit Price".toUpperCase(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Total".toUpperCase(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const BookingReceptTableData(
          title: 'Security Money',
          type: 'Try US-Cozy',
          unitPrice: 'BDT 1,000',
          total: 'BDT 1,000',
        ),
        const BookingReceptTableData(
          title: 'Rent',
          type: '30 Days',
          unitPrice: 'BDT 11,999',
          total: 'BDT 11,999',
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "SubTotal",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  "BDT 12,999".toUpperCase(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "Cash Back",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  "BDT 0.00".toUpperCase(),
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "GRAND TOTAL".toUpperCase(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  "BDT 12,999".toUpperCase(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
