// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';

import '../components/PurchaseItemDetails.dart';
import '../models/purchase_item_response.dart';

class PurchaseItemCard extends StatelessWidget {
  PurchaseItemResponse item;
  PurchaseItemCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PurchaseItemDetails(purchaseItemResponse: item)),
        );
      }),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: defaultPaddingEdge,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#${item.id}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text(
                      item.paymentStatus,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding / 4),
                  )
                ],
              ),
              Divider(
                color: primaryColor.withOpacity(0.5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: const TextSpan(children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.calendar_month_sharp,
                      color: Colors.cyan,
                      size: 18,
                    )),
                    TextSpan(
                        text: " Order Date",
                        style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.normal))
                  ])),
                  Text(numToMonth(item.date),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      )),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
            ],
          ),
        ),
      ),
    );
  }
}
