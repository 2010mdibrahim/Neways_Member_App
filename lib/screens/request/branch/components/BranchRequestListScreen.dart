// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/request/branch/bloc/RequestedBranchController.dart';
import 'package:super_home_member/screens/request/branch/models/requested_branch_response.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../components/BranchChangeRequestScreen.dart';

class BranchRequestListScreen extends StatelessWidget {
  BranchRequestListScreen({Key? key}) : super(key: key);
  final controller = Get.put(RequestedBranchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(
            backgroundColor: Colors.cyan[600],
              toolbarHeight: 35,
              title: Text("Branch Change Request List"), centerTitle: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TextButton.icon(
          style: TextButton.styleFrom(
            elevation: 5,
            backgroundColor: Colors.teal[300],
            primary: Colors.white,
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding / 1.2),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          onPressed: () async {
            await Get.to(const BranchChangeRequestScreen());
            await EasyLoading.show();
            controller.getBranch();
          },
          icon: const Icon(Icons.business_outlined, size: 18),
          label: const Text("Change Request",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),)),
      body: GetBuilder<RequestedBranchController>(
          init: RequestedBranchController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const SizedBox();
            }
            if (controller.branches.isEmpty) {
              return const Center(
                child: Text("Data Not Found!"),
              );
            }
            return Container(
              padding: defaultPaddingEdge,
              child: ListView.builder(
                itemCount: controller.branches.length,
                itemBuilder: ((context, index) {
                  return requestedBranchListContainer(
                      controller.branches[index]);
                }),
              ),
            );
          }),
    );
  }

  Widget requestedBranchListContainer(RequestedBranchResponce branch) {
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
                    "Requested Branch",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  Text(
                    branch.requestBranch,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Visibility(
                visible: branch.status == 0,
                child: InkWell(
                  onTap: () => controller.delete(branch.id),
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
                numToMonth(branch.date.toString()),
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            branch.note.toString(),
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }
}
