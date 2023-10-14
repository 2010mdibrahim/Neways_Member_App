// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';

import '../bloc/PurchaseItemController.dart';
import '../widgets/PurchaseItemCard.dart';

class PurchaseItemBody extends StatelessWidget {
  const PurchaseItemBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPaddingEdge,
      child: GetBuilder<PurchaseItemController>(
          init: PurchaseItemController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                  // child: CircularProgressIndicator(color: primaryColor),
                  );
            } else {
              if (controller.items.isEmpty) {
                return const Center(
                  child: Text("Data Not Found!"),
                );
              }
              return ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return PurchaseItemCard(item: controller.items[index]);
                },
              );
            }
          }),
    );
  }
}
