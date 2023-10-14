// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/bed_change/components/BedChangeDetailsScreen.dart';
import '../models/bed_change_response.dart';

// ignore: must_be_immutable
class BedChangeCard extends StatelessWidget {
  BedChangeResponse bed;
  BedChangeCard({
    Key? key,
    required this.bed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BedChangeDetailsScreen(bed: bed)),
        );
      }),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(defaultPadding / 3),
                    decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        border: Border.all(color: Colors.red),
                        borderRadius:
                            BorderRadius.circular(defaultPadding / 4)),
                    child: Text(
                      bed.beforeBed.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  )),
                  Expanded(
                    child: Text(
                      "TO",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(defaultPadding / 3),
                    decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        border: Border.all(color: Colors.green),
                        borderRadius:
                            BorderRadius.circular(defaultPadding / 4)),
                    child: Text(
                      bed.currentBed.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  )),
                ],
              ),
              Divider(color: Colors.grey.shade300),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Changing Date",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600),
                  ),
                  Text(
                    numToMonth(bed.data.toString()),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
