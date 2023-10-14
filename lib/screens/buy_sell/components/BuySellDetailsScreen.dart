// ignore_for_file: file_names, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/buy_sell/bloc/BuySellController.dart';
import 'package:super_home_member/screens/notification/NotificationScreen.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class BuySellDetailsScreen extends StatelessWidget {
  const BuySellDetailsScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.8),
        statusBarIconBrightness: Brightness.light));
    return SafeArea(
      child: GetBuilder<BuySellController>(
          init: BuySellController(),
          builder: (controller) {
            if (controller.isLoading) {
              return Container();
            }
            return Scaffold(
              appBar:
                  AppBar(
                    toolbarHeight: 35,
                      backgroundColor: Colors.cyan[600],
                      title: const Text("Buy & Sell"), centerTitle: true, actions: [
                IconButton(
                    onPressed: () => Get.to(const NotificationScreen()),
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.white,
                    )),
              ]),
              floatingActionButton: controller.product.status == 1
                  ? TextButton.icon(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal[400],
                          elevation: 10,
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding * 2,
                              vertical: defaultPadding / 1.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29))),
                      onPressed: () async => controller.makePhoneCall(),
                      icon: const Icon(Icons.call, size: 22),
                      label: const Text(
                        "Call",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ))
                  : const SizedBox(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.3,
                      aspectRatio: 1 / 1,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: controller.product.image
                        .map<Widget>(
                          (slider) => Center(
                            child: CachedNetworkImage(
                              imageUrl: slider.image,
                              fit: BoxFit.fitHeight,
                              width: double.infinity,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.product.title} . (${controller.product.condition})",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Posted on ${numToMonth(controller.product.postedDate.toString())} ${controller.product.postedLocation}",
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 13),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            const Divider(),
                            const SizedBox(height: defaultPadding / 2),
                            Text(
                              "TK ${controller.product.price}",
                              style: TextStyle(
                                color: Colors.green.shade800,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.grey.shade800),
                                children: [
                                  const TextSpan(text: "For sale by "),
                                  TextSpan(
                                      text:
                                          controller.product.sellBy.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Condition",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                  ),
                                )),
                                Expanded(
                                    child: Text(
                                  controller.product.condition.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                  ),
                                ))
                              ],
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Brand",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                  ),
                                )),
                                Expanded(
                                    child: Text(
                                  controller.product.brand.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                  ),
                                ))
                              ],
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Model",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                  ),
                                )),
                                Expanded(
                                    child: Text(
                                  controller.product.model.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                  ),
                                ))
                              ],
                            ),
                            const SizedBox(height: defaultPadding),
                            const Text(
                              "Features",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            Text(
                              controller.product.features.toString(),
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            const SizedBox(height: defaultPadding),
                            const Text(
                              "Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            Text(
                              controller.product.description.toString(),
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
