// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/buy_sell/bloc/BuySellController.dart';
import 'package:super_home_member/screens/buy_sell/components/SellPostScreen.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_category_response_model.dart';
import 'package:super_home_member/screens/notification/NotificationScreen.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';
import './components/BuySellListScreen.dart';

class BuySellScreen extends StatelessWidget {
  const BuySellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
          backgroundColor:  Colors.cyan[600],
          title: Text("Buy & Sell"), centerTitle: true, actions: [
        IconButton(
            onPressed: () => Get.to(const NotificationScreen()),
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
            )),
      ]),
      floatingActionButton: GetStorage().read('login') == true
          ? TextButton.icon(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor:  Colors.teal[400],
                  elevation: 10,
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding / 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29)
                  )
              ),
              onPressed: () => Get.to(SellPostScreen()),
              icon: const Icon(Icons.add_box_outlined),
              label: const Text(
                "Sell Post",
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),
              ),
            )
          : const SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetBuilder<BuySellController>(
          init: BuySellController(),
          builder: (controller) {
            return Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                        color: Colors.cyan[200],

                      ),
                    ),

                    Positioned(
                      top: 15,
                      left: defaultPadding,
                      right: defaultPadding,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextField(
                          controller: controller.search,
                          readOnly: true,
                          onTap: () {
                            controller.setCategory();
                            Get.to(const BuySellListScreen());
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding,
                                vertical: defaultPadding / 2),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "What are you looking for?",
                            suffixIcon: const Icon(Icons.search),
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14,fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding / 2),
                        decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 18,
                              color: Colors.white,
                            ),
                            SizedBox(width: defaultPadding / 4),
                            Text(
                              "All of Branches",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 4,
                        vertical: defaultPadding / 2),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        BuySellCategoryResponseModel category =
                            controller.categories[index];
                        return InkWell(
                          onTap: () {
                            controller.setCategory(value: category);
                            Get.to(const BuySellListScreen());
                          },
                          child: Card(
                            color: Colors.teal[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                CachedNetworkImage(
                                  imageUrl: category.image!,
                                  width: MediaQuery.of(context).size.width * .15,
                                  height:MediaQuery.of(context).size.height * .08,
                                ),
                                const SizedBox(height: defaultPadding / 2),
                                Text(
                                  category.categoryName!,
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
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
