// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';

import '../components/RentalDetailsScreen.dart';
import '../models/rentalInfo_response.dart';

class RentalList extends StatelessWidget {
  RentalInfoResponse response;
  int serial;
  RentalList({
    required this.response,
    required this.serial,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  RentalDetailsScreen(rentalId:response.id)),
        );
      }),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: defaultPaddingEdge,
                decoration: BoxDecoration(
                    border: Border(
                        right:
                            BorderSide(color: Colors.grey.shade100, width: 2))),
                child: Text(
                  serial.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.cyan),
                ),
              ),
              Expanded(
                child: Container(
                  padding: defaultPaddingEdge,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            response.packageName.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade800),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding / 2,
                                vertical: defaultPadding / 6),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(defaultPadding)),
                            child: Text(
                              response.rentStatus,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding / 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            numToMonth(response.date),
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                          Text(
                            "${response.rechargeDays} Days",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade800),
                          ),
                          Text(
                            "BDT ${response.totalAmount}",
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/// new
/*
import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';

import '../components/RentalDetailsScreen.dart';
import '../models/rentalInfo_response.dart';

class RentalList extends StatelessWidget {
  RentalInfoResponse response;
  int serial;
  RentalList({
    required this.response,
    required this.serial,
    Key? key,
  }) : super(key: key);

  /// var upDate = int.parse(widget.purchaseData.date.substring(0, 2)) + 1;


  @override
  Widget build(BuildContext context) {
    var amount =response.totalAmount;
    var totalAmount = int.parse(amount)+1000;
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  RentalDetailsScreen(rentalId:response.id)),
        );
      }),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: defaultPaddingEdge,
                decoration: BoxDecoration(
                    border: Border(
                        right:
                            BorderSide(color: Colors.grey.shade100, width: 2))),
                child: Text(
                  serial.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: primaryColor),
                ),
              ),
              Expanded(
                child: Container(
                  padding: defaultPaddingEdge,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            response.packageName.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade800),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding / 2,
                                vertical: defaultPadding / 6),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(defaultPadding)),
                            child: Text(
                              response.rentStatus,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding / 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            numToMonth(response.date),
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                          Text(
                            "${response.rechargeDays} Days",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade800),
                          ),
                          Text(
                            "BDT $totalAmount",
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 */

/// prev
/*
import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';

import '../components/RentalDetailsScreen.dart';
import '../models/rentalInfo_response.dart';

class RentalList extends StatelessWidget {
  RentalInfoResponse response;
  int serial;
  RentalList({
    required this.response,
    required this.serial,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  RentalDetailsScreen(rentalId:response.id)),
        );
      }),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: defaultPaddingEdge,
                decoration: BoxDecoration(
                    border: Border(
                        right:
                            BorderSide(color: Colors.grey.shade100, width: 2))),
                child: Text(
                  serial.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: primaryColor),
                ),
              ),
              Expanded(
                child: Container(
                  padding: defaultPaddingEdge,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            response.packageName.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade800),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding / 2,
                                vertical: defaultPadding / 6),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(defaultPadding)),
                            child: Text(
                              response.rentStatus,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding / 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            numToMonth(response.date),
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                          Text(
                            "${response.rechargeDays} Days",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade800),
                          ),
                          Text(
                            "BDT ${response.totalAmount}",
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 */