// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/request/bed/bloc/RequestedBedController.dart';
import 'package:super_home_member/screens/request/bed/models/requested_bed_response.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../components/BedChangeRequestScreen.dart';

class BedRequestListScreen extends StatelessWidget {
  BedRequestListScreen({Key? key}) : super(key: key);
  final controller = Get.put(RequestedBedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight: 35,
          title: Text("Bed Change Request List"), centerTitle: true),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: TextButton.icon(
      //     style: TextButton.styleFrom(
      //       elevation: 5,
      //       backgroundColor: primaryColor,
      //       primary: Colors.white,
      //       padding: const EdgeInsets.symmetric(
      //           horizontal: defaultPadding * 1.5,
      //           vertical: defaultPadding / 1.2),
      //       shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.all(Radius.circular(50)),
      //       ),
      //     ),
      //     onPressed: () async {
      //       await Get.to(const BedChangeRequestScreen());
      //       await EasyLoading.show();
      //       controller.getBeds();
      //     },
      //     icon: const Icon(Icons.bed_rounded, size: 18),
      //     label: const Text("Change Request")),
      body: GetBuilder<RequestedBedController>(
        init: RequestedBedController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const SizedBox();
          }
          if (controller.beds.isEmpty) {
            return const Center(
              child: Text("Data Not Found!"),
            );
          }
          return Container(
            padding: defaultPaddingEdge,
            child: ListView.builder(
              itemCount: controller.beds.length,
              itemBuilder: (context, index) {
                return requestedListContainer(controller.beds[index]);
              },
            ),
          );
        },
      ),
    );
  }

  Widget requestedListContainer(RequestedBedResponce bed) {
    return Container(
      padding: defaultPaddingEdge,
      margin: const EdgeInsets.only(bottom: defaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultPadding / 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Requested Bed",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  Text(
                    "${bed.floorName} - ${bed.unitName} (${bed.bedName})",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Visibility(
                visible: bed.status == 0,
                child: InkWell(
                  onTap: () => controller.delete(bed.id),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Note",
                style: TextStyle(
                    color: Colors.grey.shade700, fontWeight: FontWeight.bold),
              ),
              Text(
                numToMonth(bed.date.toString()),
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            bed.note.toString(),
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }
}
