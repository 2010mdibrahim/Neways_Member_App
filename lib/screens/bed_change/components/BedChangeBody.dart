// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/bed_change/bloc/BedChangeController.dart';
import 'package:super_home_member/screens/bed_change/widgets/BedChangeCard.dart';

class BedChangeBody extends StatelessWidget {
  const BedChangeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPaddingEdge,
      child: GetBuilder<BedChangeController>(
          init: BedChangeController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                  // child: CircularProgressIndicator(
                  //   color: primaryColor,
                  // ),
                  );
            } else {
              if (controller.beds.isEmpty) {
                return const Center(
                  child: Text("Data Not Found!"),
                );
              }
              return ListView.builder(
                itemCount: controller.beds.length,
                itemBuilder: (context, index) {
                  return BedChangeCard(
                    bed: controller.beds[index],
                  );
                },
              );
            }
          }),
    );
  }
}
