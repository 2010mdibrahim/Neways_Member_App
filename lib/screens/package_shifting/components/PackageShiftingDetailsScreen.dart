// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/package_shifting/models/package_shifting_response.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class PackageShiftingDetailsScreen extends StatelessWidget {
  PackageShiftingResponse package;
  PackageShiftingDetailsScreen({Key? key, required this.package})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(
            toolbarHeight: 35,
            backgroundColor: Colors.cyan[600],
            title: const Text("Package Shifting Details"),centerTitle: true,),
      body: Padding(
        padding: defaultPaddingEdge,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5,0,5,0),
              child: Row(
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
                        numToMonth(package.requestDate),
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
                        numToMonth(package.changedDate),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Old Category",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          ),
                          Text(
                            package.oldCategory,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "New Category",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          ),
                          Text(
                            package.newCategory,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700),
                          ),
                        ],
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
                            "Old Package",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          ),
                          Text(
                            package.oldPackage,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "New Package",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          ),
                          Text(
                            package.newPackage,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700),
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
    );
  }
}
