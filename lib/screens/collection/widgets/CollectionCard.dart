// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';

import '../components/CollectionDetails.dart';
import '../models/collection_response.dart';

class CollectionCard extends StatelessWidget {
  CollectionResponse collection;
  CollectionCard({
    required this.collection,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CollectionDetails(collection: collection),
            ),
          )),
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
              const SizedBox(height: defaultPadding / 2),
              Row(
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
                      const SizedBox(height: defaultPadding / 4),
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
                        "Total Amount",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Text(
                        "BDT ${collection.total} ৳",
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
