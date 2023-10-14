// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import '../bloc/DiningController.dart';
import '../widgets/DiningCard.dart';

class DiningBody extends StatelessWidget {
  const DiningBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPaddingEdge,
      child: GetBuilder<DiningController>(
          init: DiningController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                  // child: CircularProgressIndicator(
                  //   color: primaryColor,
                  // ),
                  );
            }
            if (controller.dinings.isEmpty) {
              return const Center(
                child: Text("Data Not Found!"),
              );
            }
            return ListView.builder(
              itemCount: controller.dinings.length,
              itemBuilder: (context, index) {
                return DiningCard(
                  dining: controller.dinings[index],
                );
              },
            );
          }),
    );
  }
}
