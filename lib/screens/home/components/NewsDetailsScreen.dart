// ignore_for_file: file_names, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/bloc/LatestNewsDetailsController.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class NewsDetailsScreen extends StatelessWidget {
  dynamic slug;
  NewsDetailsScreen({
    Key? key,
    required this.slug,
  }) : super(key: key);
  final controller = Get.put(LatestNewsDetailsController());
  @override
  Widget build(BuildContext context) {
    controller.getNews(slug: slug);
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: const Text("Details News"),centerTitle: true,),
      body: GetBuilder<LatestNewsDetailsController>(
          init: LatestNewsDetailsController(),
          builder: (controller) {
            if (controller.isLoadding) {
              return Container();
            }
            return Container(
              padding: defaultPaddingEdge,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.news.title,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.grey.shade600,
                              size: 17,
                            ),
                          ),
                          TextSpan(
                              text: " ${controller.news.date}",
                              style: TextStyle(color: Colors.grey.shade600))
                        ])),
                        const SizedBox(
                          width: defaultPadding / 2,
                        ),
                        // RichText(
                        //     text: TextSpan(children: [
                        //   WidgetSpan(
                        //     child: Icon(
                        //       Icons.remove_red_eye_rounded,
                        //       color: Colors.grey.shade600,
                        //       size: 17,
                        //     ),
                        //   ),
                        //   // TextSpan(
                        //   //     text: " VIEW ",
                        //   //     style: TextStyle(
                        //   //         color: Colors.grey.shade600, fontSize: 12)),
                        //   TextSpan(
                        //       text: " ${controller.news.view}",
                        //       style: TextStyle(
                        //           color: Colors.grey.shade600,
                        //           fontWeight: FontWeight.bold)),
                        // ])),
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      imageUrl: controller.news.image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(defaultPadding / 2),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Text(
                      controller.news.description,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
