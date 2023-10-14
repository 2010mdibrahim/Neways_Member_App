// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../bloc/BedChangeController.dart';
import '../bloc/BedFindController.dart';
import '../models/changeable_bed_response.dart';

class FindAvailableBedScreen extends StatelessWidget {
  const FindAvailableBedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Find Available Bed", centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: defaultPaddingEdge,
          child: GetBuilder<BedFindController>(
              init: BedFindController(),
              builder: (controller) {
                if (controller.isLoading) {
                  return Shimmer(
                      child: const SizedBox(
                        height: 200,
                        width: double.infinity,
                      ),
                      gradient: LinearGradient(colors: [
                        Colors.grey.shade200,
                        Colors.grey.shade600
                      ]));
                }
                return ListView.builder(
                  itemCount: controller.beds.length,
                  itemBuilder: (context, index) {
                    ChangeableBedResponse bed = controller.beds[index];
                    return Container(
                      padding: defaultPaddingEdge,
                      margin: const EdgeInsets.only(bottom: defaultPadding / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultPadding / 2),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${bed.floorName} (${bed.unitName} Unit)",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: defaultPaddingEdge,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(defaultPadding),
                                  color: Colors.green,
                                ),
                                child: Text(
                                  bed.uses.toString().toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Room",
                                      style: TextStyle(
                                          color: Colors.grey.shade800)),
                                  Text(bed.roomName,
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Bed",
                                      style: TextStyle(
                                          color: Colors.grey.shade800)),
                                  Text(bed.bedName,
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(29)),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: defaultPadding),
                                    elevation: 2,
                                    backgroundColor: primaryColor,
                                    primary: Colors.white),
                                onPressed: () {
                                  Get.put(BedChangeController())
                                      .setRequetedBed(bed);
                                  Get.back();
                                },
                                child: const Text("Book Now")),
                          )
                        ],
                      ),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
