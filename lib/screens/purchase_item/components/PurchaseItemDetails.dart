// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../models/purchase_item_response.dart';

class PurchaseItemDetails extends StatelessWidget {
  PurchaseItemResponse purchaseItemResponse;
  PurchaseItemDetails({Key? key, required this.purchaseItemResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: const Text("Purchase Item Details")
      ),
      body: Container(
        padding: defaultPaddingEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.calendar_month_sharp,
                    color: Colors.cyan,
                    size: 18,
                  )),
                  TextSpan(
                      text: " ${numToMonth(purchaseItemResponse.date)}",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold))
                ])),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Text(
                    purchaseItemResponse.paymentStatus
                        .toString()
                        .toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding / 4),
                )
              ],
            ),
            const SizedBox(height: defaultPadding),
            Container(
              padding: defaultPaddingEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultPadding / 4)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Item",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Qty",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Price",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Total",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade400,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: purchaseItemResponse.items.length,
                    itemBuilder: (context, index) {
                      Item item = purchaseItemResponse.items[index];
                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.itemName,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item.qty.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${item.amount} ৳",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${item.amount} ৳",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                        child: Text(
                          "Grand Total",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade900),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "BDT ${purchaseItemResponse.totalAmount} ৳",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade900),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
