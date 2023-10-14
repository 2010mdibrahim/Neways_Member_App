// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import '../bloc/CheckoutItemController.dart';
import '../models/checkout_item_response.dart';

class CheckoutItemBody extends StatelessWidget {
  const CheckoutItemBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPaddingEdge,
      child: GetBuilder<CheckoutItemController>(
          init: CheckoutItemController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                  // child: CircularProgressIndicator(color: primaryColor),
                  );
            }
            if (controller.items.isEmpty) {
              return const Center(
                child: Text("Data Not Found!"),
              );
            }
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: defaultPaddingEdge,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.teal[200],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(defaultPadding / 4),
                                topRight: Radius.circular(defaultPadding / 4))),
                        child: const Text("Returnable Items",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.items.length,
                            itemBuilder: ((context, index) {
                              CheckoutItemResponse item =
                                  controller.items[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.name.toUpperCase(),style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                    color: Colors.grey[800]
                                  ),),
                                  const Divider(),
                                ],
                              );
                            })),
                      ),
                      Visibility(
                          visible: controller.items.isEmpty,
                          child: const Padding(
                            padding: EdgeInsets.all(defaultPadding),
                            child: Center(
                              child: Text("Item Not Found!"),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
