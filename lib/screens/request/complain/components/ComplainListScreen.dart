// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/request/complain/bloc/ComplainListController.dart';
import 'package:super_home_member/screens/request/complain/models/complain_response.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../components/ComplainScreen.dart';

class ComplainListScreen extends StatelessWidget {
  ComplainListScreen({Key? key}) : super(key: key);
  final controller = Get.put(ComplainListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight: 35,
          title: Text("Complaint List"), centerTitle: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TextButton.icon(
          style: TextButton.styleFrom(
            elevation: 5,
            backgroundColor: Colors.teal[300],
            primary: Colors.white,
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding / 1.2
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          onPressed: () async {
            await Get.to(const ComplainScreen());
            await EasyLoading.show();
            controller.getComplains();
          },
          icon: const Icon(Icons.report_problem_rounded, size: 18),
          label: const Text("Submit Complaint",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),),
      ),
      body:
      GetBuilder<ComplainListController>(
        init: ComplainListController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const SizedBox();
          }
          if (controller.complains.isEmpty) {
            return const Center(
              child: Text("Data Not Found!"),
            );
          }
          return Container(
            padding: defaultPaddingEdge,
            child: ListView.builder(
              itemCount: controller.complains.length,
              itemBuilder: (context, index) {
                return requestedListContainer(controller.complains[index]);
              },
            ),
          );
        },
      ),
    );
  }

  Widget requestedListContainer(ComplainResponce complain) {
    // print(complain.createdAt);
    final DateTime date =
        DateTime.fromMillisecondsSinceEpoch(int.parse(complain.createdAt));
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
                    "Problem",
                    style: TextStyle(color: Colors.red,fontSize: 13,fontWeight: FontWeight.w700),
                  ),
                  Text(
                    complain.name,
                    style: TextStyle(color: Colors.grey.shade700,fontSize: 15,fontWeight: FontWeight.w800)
                  )
                ],
              ),
              Visibility(
                visible: complain.status == 0 || complain.status == 1,
                child: InkWell(
                  onTap: () => controller.delete(complain.id),
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
                "Details",
                style: TextStyle(
                    color: Colors.grey.shade700, fontWeight: FontWeight.bold),
              ),
              Text(
                numToMonth("${date.day}/${date.month}/${date.year}"),
                style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            complain.note,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
