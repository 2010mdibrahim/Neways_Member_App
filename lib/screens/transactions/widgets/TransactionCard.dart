// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';

import '../models/transction_response.dart';

class TransactionCard extends StatelessWidget {
  TransctionResponse transction;
  TransactionCard({
    required this.transction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: defaultPaddingEdge,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transction.transactionId,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding / 4),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(defaultPadding)),
                    child: Text(
                      transction.transactionType,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    )),
              ],
            ),
            const SizedBox(height: defaultPadding / 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      transction.transactionCategory,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      "BDT ${transction.amount} ৳",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "By",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        transction.employeeName,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Date & Time",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        numToMonth(transction.date),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
