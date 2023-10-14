// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';

import '../bloc/CollectionController.dart';
import '../widgets/CollectionCard.dart';

class CollectionBody extends StatelessWidget {
  const CollectionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPaddingEdge,
      child: GetBuilder<CollectionController>(
          init: CollectionController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                  // child: CircularProgressIndicator(
                  //   color: primaryColor,
                  // ),
                  );
            }
            if (controller.collections.isEmpty) {
              return const Center(
                child: Text("Data Not Found!"),
              );
            }
            return ListView.builder(
              itemCount: controller.collections.length,
              itemBuilder: (context, index) {
                return CollectionCard(
                    collection: controller.collections[index]);
              },
            );
          }),
    );
  }
}
