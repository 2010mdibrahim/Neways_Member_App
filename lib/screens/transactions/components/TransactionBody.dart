// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';

import '../bloc/TransctionController.dart';
import '../widgets/TransactionCard.dart';

class TransactionBody extends StatelessWidget {
  const TransactionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPaddingEdge,
      child: GetBuilder<TransctionController>(
          init: TransctionController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                  // child: CircularProgressIndicator(
                  //   color: primaryColor,
                  // ),
                  );
            } else {
              if (controller.transctions.isEmpty) {
                return const Center(
                  child: Text("Data Not Found!"),
                );
              }
              return ListView.builder(
                itemCount: controller.transctions.length,
                itemBuilder: (context, index) {
                  return TransactionCard(
                      transction: controller.transctions[index]);
                },
              );
            }
          }),
    );
  }
}
