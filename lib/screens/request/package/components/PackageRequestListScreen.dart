// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/request/package/bloc/RequestedPackageController.dart';
import 'package:super_home_member/screens/request/package/models/requested_package_response.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../components/PackageChangeRequestScreen.dart';

class PackageRequestListScreen extends StatelessWidget {
  PackageRequestListScreen({Key? key}) : super(key: key);
  final controller = Get.put(RequestedPackageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(
            backgroundColor: Colors.cyan[600],
              toolbarHeight: 35,
              title: Text("Package Change Request List"), centerTitle: true),
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
            await Get.to(const PackageChangeRequestScreen());
            await EasyLoading.show();
            controller.getPackages();
          },
          icon: const Icon(Icons.add_home_work_rounded, size: 18),
          label: const Text("Change Request",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 14),)),
      body: GetBuilder<RequestedPackageController>(
          init: RequestedPackageController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const SizedBox();
            }
            if (controller.packages.isEmpty) {
              return const Center(
                child: Text("Data Not Found!"),
              );
            }
            return Container(
              padding: defaultPaddingEdge,
              child: ListView.builder(
                itemCount: controller.packages.length,
                itemBuilder: ((context, index) {
                  return requestedListContainer(controller.packages[index]);
                }),
              ),
            );
          }),
    );
  }

  Widget requestedListContainer(RequestedPackageResponce package) {
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
                    "Requested Package",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  Text(
                    "${package.requestPackage} (${package.requestPackageCategory})",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Visibility(
                visible: package.status == 0,
                child: InkWell(
                  onTap: () => controller.delete(package.id),
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
                numToMonth(package.date.toString()),
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            package.note.toString(),
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }
}
