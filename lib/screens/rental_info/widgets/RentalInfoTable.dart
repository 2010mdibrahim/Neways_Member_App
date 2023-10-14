// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

import '../models/rentalInfo_details_response.dart';
import '../widgets/RentalInfoTableData.dart';

class RentalInfoTable extends StatelessWidget {
  RentalInfoDetailsResponse data;
  RentalInfoTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: defaultPaddingEdge,
          // color: primaryColor.withOpacity(0.25),
          color: Colors.cyan[100],
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
              // Expanded(
              //   child: Text(
              //     "Type".toUpperCase(),
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         color: Colors.grey.shade800,
              //         fontSize: 12,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
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
        ListView.builder(
          shrinkWrap: true,
          itemCount: data.items.length,
          itemBuilder: (context, index) {
            Item item = data.items[index];
            return RentalInfoTableData(
              title: item.itemName,
              type: '-',
              unitPrice: 'BDT ${item.rentAmount}',
              total: 'BDT ${item.rentAmount}',
            );
          },
        ),
        const SizedBox(
          height: defaultPadding / 2,
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
                  "BDT ${data.totalAmount}".toUpperCase(),
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
                  "BDT ${data.discountMoney}".toUpperCase(),
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
                  "BDT ${double.parse(data.totalAmount) - double.parse(data.discountMoney)}"
                      .toUpperCase(),
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
