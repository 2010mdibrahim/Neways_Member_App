// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/request/bed/bloc/BedFindController.dart';
import 'package:super_home_member/screens/request/bed/models/changeable_bed_response.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class AvaiableBedScreen extends StatelessWidget {
  const AvaiableBedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: Text("Available Bed"), centerTitle: true),
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
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.end,
                              //   children: [
                              //     Text("Bed",
                              //         style: TextStyle(
                              //             color: Colors.grey.shade800)),
                              //     Text(bed.bedName,
                              //         style: TextStyle(
                              //             color: Colors.grey.shade800,
                              //             fontWeight: FontWeight.bold)),
                              //   ],
                              // ),
                            ],
                          ),
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
