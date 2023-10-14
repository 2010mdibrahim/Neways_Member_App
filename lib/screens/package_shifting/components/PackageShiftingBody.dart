// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/package_shifting/bloc/PackageShiftingController.dart';
import 'package:super_home_member/screens/package_shifting/widgets/PackageShiftingCard.dart';

class PackageShiftingBody extends StatelessWidget {
  const PackageShiftingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPaddingEdge,
      child: GetBuilder<PackageShiftingController>(
          init: PackageShiftingController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                  // child: CircularProgressIndicator(
                  //   color: primaryColor,
                  // ),
                  );
            } else {
              if (controller.packages.isEmpty) {
                return const Center(
                  child: Text("Data Not Found!"),
                );
              }
              return ListView.builder(
                itemCount: controller.packages.length,
                itemBuilder: (context, index) {
                  return PackageShiftingCard(
                    package: controller.packages[index],
                  );
                },
              );
            }
          }),
    );
  }
}
