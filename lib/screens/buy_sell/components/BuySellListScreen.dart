// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/buy_sell/bloc/BuySellController.dart';
import 'package:super_home_member/screens/buy_sell/components/BuySellDetailsScreen.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_response_model.dart';
import 'package:super_home_member/screens/notification/NotificationScreen.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class BuySellListScreen extends StatelessWidget {
  const BuySellListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: Text("Buy & Sell"), centerTitle: true, actions: [
        IconButton(
            onPressed: () => Get.to(const NotificationScreen()),
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
            )),
      ]),
      body: GetBuilder<BuySellController>(
          init: BuySellController(),
          builder: (controller) {
            return Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.teal[200],
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(25),
                        //   bottomRight: Radius.circular(25),
                        // ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: defaultPadding,
                      right: defaultPadding,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextField(
                          // controller: controller.note,
                          onChanged: ((value) => controller
                              .getAllBuySellProducts(searchStr: value)),
                          keyboardType: TextInputType.text,
                          autofocus: controller.autofocus,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding,
                                vertical: defaultPadding / 2),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "What are you looking for?",
                            suffixIcon: const Icon(Icons.search),
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(defaultPadding),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 18,
                                    color: primaryColor,
                                  ),
                                  SizedBox(width: defaultPadding / 4),
                                  Text(
                                    "All Branches",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 2,
                              color: Colors.grey.shade400,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.sell_rounded,
                                    size: 18,
                                    color: primaryColor,
                                  ),
                                  const SizedBox(width: defaultPadding / 4),
                                  Text(
                                    controller.category.categoryName!,
                                    style: const TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                            controller.setBuySell(buysell);
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
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 100,
                                    ),
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 100,
                                  ),
                                ),
                                const SizedBox(width: defaultPadding / 2),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        buysell.title.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade800),
                                      ),
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
                                )
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
