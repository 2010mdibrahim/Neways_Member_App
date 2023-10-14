// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../models/collection_response.dart';

class CollectionDetails extends StatelessWidget {
  CollectionResponse collection;
  CollectionDetails({Key? key, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: Text("Details Collections"),centerTitle: true,),
      body: Padding(
        padding: defaultPaddingEdge,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5,8,5,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    collection.transactionId,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    numToMonth(collection.date),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Padding(
              padding: const EdgeInsets.fromLTRB(5,0,5,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Collection Purpose",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        collection.collectionPurpose,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Transaction Type",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        collection.paymentMethod,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultPadding / 4)),
              child: Column(
                children: [
                  Container(
                    padding: defaultPaddingEdge,
                    decoration: BoxDecoration(
                        color:Colors.teal[50],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(defaultPadding / 4),
                            topRight: Radius.circular(defaultPadding / 4))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Title".toUpperCase(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Amount".toUpperCase(),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Container(
                    padding: defaultPaddingEdge,
                    child: Column(
                      children: [
                        Visibility(
                          visible:
                              double.parse(collection.cardAmount.toString()) >
                                  0,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Card",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "BDT ${collection.cardAmount} ৳",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: double.parse(collection.cashAmount) > 0,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Cash",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "BDT ${collection.cashAmount} ৳",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: double.parse(collection.mobileAmount) > 0,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Mobile",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "BDT ${collection.mobileAmount} ৳",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: double.parse(collection.chequeAmount) > 0,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Check",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "BDT ${collection.chequeAmount} ৳",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade800,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Total".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "BDT ${collection.total} ৳",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
