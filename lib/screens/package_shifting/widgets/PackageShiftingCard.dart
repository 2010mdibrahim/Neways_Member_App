// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/package_shifting/components/PackageShiftingDetailsScreen.dart';
import 'package:super_home_member/screens/package_shifting/models/package_shifting_response.dart';

// ignore: must_be_immutable
class PackageShiftingCard extends StatelessWidget {
  PackageShiftingResponse package;
  PackageShiftingCard({
    Key? key,
    required this.package,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PackageShiftingDetailsScreen(package: package)),
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
                      child: Text(
                    package.oldPackage,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
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
                      child: Text(
                    package.newPackage,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.teal),
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
                    numToMonth(package.changedDate),
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
