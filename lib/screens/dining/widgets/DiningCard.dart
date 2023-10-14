// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';

import '../models/dining_response.dart';

class DiningCard extends StatelessWidget {
  DiningResponse dining;
  DiningCard({
    Key? key,
    required this.dining,
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
                    dining.day,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Text(
                    numToMonth(dining.date),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Breakfast",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(
                        height: defaultPadding / 4,
                      ),
                      Container(
                        padding: const EdgeInsets.all(defaultPadding / 4),
                        decoration: BoxDecoration(
                            color: dining.breakfast ? Colors.green : Colors.red,
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 4)),
                        child: Text(
                          dining.breakfast ? "YES" : "NO",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Lunch",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(
                        height: defaultPadding / 4,
                      ),
                      Container(
                        padding: const EdgeInsets.all(defaultPadding / 4),
                        decoration: BoxDecoration(
                            color: dining.lunch ? Colors.green : Colors.red,
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 4)),
                        child: Text(
                          dining.lunch ? "YES" : "NO",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Dinner",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(
                        height: defaultPadding / 4,
                      ),
                      Container(
                        padding: const EdgeInsets.all(defaultPadding / 4),
                        decoration: BoxDecoration(
                            color: dining.dinner ? Colors.green : Colors.red,
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 4)),
                        child: Text(
                          dining.dinner ? 'YES' : "NO",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
