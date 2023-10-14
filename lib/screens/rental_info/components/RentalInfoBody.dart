// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';

import '../bloc/RentalInfoController.dart';
import '../widgets/RentalList.dart';

class RentalInfoBody extends StatelessWidget {
  const RentalInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bodyColor,
      margin: const EdgeInsets.all(defaultPadding / 4),
      child: GetBuilder<RentalInfoController>(
          init: RentalInfoController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                  // child: CircularProgressIndicator(
                  //   color: primaryColor,
                  // ),
                  );
            } else {
              if (controller.rentalInfoResponses.isEmpty) {
                return const Center(
                  child: Text("Data Not Found!"),
                );
              }
              return ListView.builder(
                reverse: false,
                itemCount: controller.rentalInfoResponses.length,
                itemBuilder: ((context, index) {
                  return RentalList(
                    response: controller.rentalInfoResponses[index],
                    serial: ++index,
                  );
                }),
              );
            }
          }),
    );
  }
}
