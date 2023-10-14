// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/buy_sell/bloc/BuySellController.dart';
import 'package:super_home_member/screens/buy_sell/bloc/MySellController.dart';
import 'package:super_home_member/screens/buy_sell/components/AddSellPostScreen.dart';
import 'package:super_home_member/screens/buy_sell/components/BuySellDetailsScreen.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_response_model.dart';
import 'package:super_home_member/screens/notification/NotificationScreen.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class SellPostScreen extends StatelessWidget {
  SellPostScreen({Key? key}) : super(key: key);
  final BuySellController buySellController = Get.put(BuySellController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: const Text("My Sell Post"), centerTitle: true, actions: [
        IconButton(
            onPressed: () => Get.to(const NotificationScreen()),
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
            )
        ),
      ]),
      floatingActionButton: TextButton.icon(
        style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.teal[400],
            elevation: 10,
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29))),
        onPressed: () => Get.to(const AddSellPostScreen()),
        icon: const Icon(Icons.add),
        label: const Text(
          "Add Sell Post",
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetBuilder<MySellController>(
          init: MySellController(),
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 4),
                    child: ListView.builder(
                      itemCount: controller.buysells.length,
                      itemBuilder: (context, index) {
                        BuySellResponseModel buysell =
                            controller.buysells[index];
                        return InkWell(
                          onTap: () {
                            buySellController.setBuySell(buysell);
                            Get.to(const BuySellDetailsScreen());
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding / 2)),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft:
                                          Radius.circular(defaultPadding / 2),
                                      bottomLeft:
                                          Radius.circular(defaultPadding / 2)),
                                  child: Image.network(
                                    buysell.image ??
                                        "https://www.all-tools-online.com/wp-content/uploads/2018/06/noPhotoFound.png",
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.network(
                                      "https://www.all-tools-online.com/wp-content/uploads/2018/06/noPhotoFound.png",
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Text('Image Not Found'),
                                      fit: BoxFit.fitHeight,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 100,
                                    ),
                                    fit: BoxFit.fitHeight,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 100,
                                  ),
                                ),
                                const SizedBox(width: defaultPadding / 2),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: buysell.title.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade800),
                                        ),
                                        TextSpan(
                                          text:
                                              " (${buysell.status == 0 ? 'Unpublished' : buysell.status == 1 ? 'Published' : 'Sold'})",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey.shade700),
                                        ),
                                      ])),
                                      const SizedBox(
                                          height: defaultPadding / 4),
                                      Text(
                                        buysell.location.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey.shade700),
                                      ),
                                      const SizedBox(
                                          height: defaultPadding / 2),
                                      Text(
                                        "TK ${buysell.price}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green.shade800),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              radius: 5,
                                              title: "Delete Product",
                                              contentPadding:
                                                  const EdgeInsets.all(
                                                      defaultPadding),
                                              content: const Text(
                                                  "Are you sure? Do you want to delete?"),
                                              confirm: TextButton(
                                                  style: TextButton.styleFrom(
                                                      primary: Colors.white,
                                                      backgroundColor:
                                                          Colors.green),
                                                  onPressed: () async {
                                                    Get.back();
                                                    var status =
                                                        await controller.delete(
                                                            buysell.id
                                                                .toString());
                                                    if (status == true) {
                                                      Get.snackbar(
                                                        'Success',
                                                        "Product Delete Successfull",
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        colorText: Colors.white,
                                                        margin: const EdgeInsets
                                                            .all(8),
                                                        backgroundColor:
                                                            Colors.black,
                                                      );
                                                    }
                                                  },
                                                  child: const Text("Yes")),
                                              cancel: TextButton(
                                                style: TextButton.styleFrom(
                                                    primary: Colors.white,
                                                    backgroundColor:
                                                        Colors.red),
                                                onPressed: () => Get.back(),
                                                child: const Text("No"),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                            color: Colors.red,
                                          ),
                                        ),
                                        const SizedBox(
                                            height: defaultPadding / 2),
                                        IconButton(
                                            onPressed: () => Get.defaultDialog(
                                                  radius: 5,
                                                  title: "Update Status",
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          defaultPadding),
                                                  content: Wrap(
                                                    children: [
                                                      TextButton(
                                                        onPressed: () async {
                                                          if (buysell.status !=
                                                              1) {
                                                            Get.back();
                                                            var status = await controller
                                                                .updateProduct(
                                                                    id: buysell
                                                                        .id
                                                                        .toString(),
                                                                    status:
                                                                        '1');
                                                            if (status ==
                                                                true) {
                                                              Get.snackbar(
                                                                'Success',
                                                                "Product Published Successfull",
                                                                snackPosition:
                                                                    SnackPosition
                                                                        .BOTTOM,
                                                                colorText:
                                                                    Colors
                                                                        .white,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                              );
                                                            }
                                                          } else {
                                                            Get.back();
                                                          }
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    buysell.status == 1
                                                                        ? Colors
                                                                            .green
                                                                        : Colors
                                                                            .white,
                                                                primary: buysell
                                                                            .status ==
                                                                        1
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade700,
                                                                side:
                                                                    BorderSide(
                                                                  color: buysell
                                                                              .status ==
                                                                          1
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .grey
                                                                          .shade700,
                                                                ),
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        defaultPadding)),
                                                        child: const Text(
                                                          "Publish",
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          width:
                                                              defaultPadding /
                                                                  2),
                                                      TextButton(
                                                        onPressed: () async {
                                                          if (buysell.status !=
                                                              0) {
                                                            Get.back();
                                                            var status = await controller
                                                                .updateProduct(
                                                                    id: buysell
                                                                        .id
                                                                        .toString(),
                                                                    status:
                                                                        '0');
                                                            if (status ==
                                                                true) {
                                                              Get.snackbar(
                                                                'Success',
                                                                "Product UnPublished Successfull",
                                                                snackPosition:
                                                                    SnackPosition
                                                                        .BOTTOM,
                                                                colorText:
                                                                    Colors
                                                                        .white,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                              );
                                                            }
                                                          } else {
                                                            Get.back();
                                                          }
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    buysell.status == 0
                                                                        ? Colors
                                                                            .red
                                                                        : Colors
                                                                            .white,
                                                                primary: buysell
                                                                            .status ==
                                                                        0
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade700,
                                                                side:
                                                                    BorderSide(
                                                                  color: buysell
                                                                              .status ==
                                                                          0
                                                                      ? Colors
                                                                          .red
                                                                      : Colors
                                                                          .grey
                                                                          .shade700,
                                                                ),
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        defaultPadding)),
                                                        child: const Text(
                                                          "UnPublish",
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          width:
                                                              defaultPadding /
                                                                  2),
                                                      TextButton(
                                                        onPressed: () async {
                                                          if (buysell.status !=
                                                              2) {
                                                            Get.back();
                                                            var status = await controller
                                                                .updateProduct(
                                                                    id: buysell
                                                                        .id
                                                                        .toString(),
                                                                    status:
                                                                        '2');
                                                            if (status ==
                                                                true) {
                                                              Get.snackbar(
                                                                'Success',
                                                                "Product UnPublished Successfull",
                                                                snackPosition:
                                                                    SnackPosition
                                                                        .BOTTOM,
                                                                colorText:
                                                                    Colors
                                                                        .white,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                              );
                                                            }
                                                          } else {
                                                            Get.back();
                                                          }
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    buysell.status == 2
                                                                        ? Colors
                                                                            .blue
                                                                        : Colors
                                                                            .white,
                                                                primary: buysell
                                                                            .status ==
                                                                        2
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade700,
                                                                side:
                                                                    BorderSide(
                                                                  color: buysell
                                                                              .status ==
                                                                          2
                                                                      ? Colors
                                                                          .blue
                                                                      : Colors
                                                                          .grey
                                                                          .shade700,
                                                                ),
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        defaultPadding)),
                                                        child: const Text(
                                                          "Sold",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            icon: const Icon(Icons.update,
                                                color: primaryColor)),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
