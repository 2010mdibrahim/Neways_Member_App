// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/bed_change/models/bed_change_response.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class BedChangeDetailsScreen extends StatelessWidget {
  BedChangeResponse bed;
  BedChangeDetailsScreen({Key? key, required this.bed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            buildAppBar(context: context, title: "Package Shifting Details"),
        body: Padding(
          padding: defaultPaddingEdge,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Request Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                      Text(
                        numToMonth(bed.data),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: primaryColor),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Changing Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                      Text(
                        numToMonth(bed.changeDate),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Change By",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                      Text(
                        bed.employeeName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: primaryColor),
                      ),
                      Text(
                        "(${bed.employeeId})",
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, color: primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade300),
              Container(
                padding: defaultPaddingEdge,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 2)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Old Bed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            Container(
                              padding: const EdgeInsets.all(defaultPadding / 3),
                              decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(
                                      defaultPadding / 4)),
                              child: Text(
                                bed.beforeBed.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Current Bed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            Container(
                              padding: const EdgeInsets.all(defaultPadding / 3),
                              decoration: BoxDecoration(
                                  color: Colors.green.shade100,
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(
                                      defaultPadding / 4)),
                              child: Text(
                                bed.currentBed.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
