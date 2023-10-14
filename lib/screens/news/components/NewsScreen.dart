// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/home/components/NewsDetailsScreen.dart';
import 'package:super_home_member/screens/home/models/latest_news_response.dart';
import 'package:super_home_member/screens/news/bloc/NewsController.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: Text("News"), centerTitle: true),
      body: Padding(
        padding: defaultPaddingEdge,
        child: GetBuilder<NewsController>(
            init: NewsController(),
            builder: (controller) {
              if (controller.isLoading) {
                // return const CircularProgressIndicator();
              }
              return ListView.builder(
                itemCount: controller.news.length,
                itemBuilder: (context, index) {
                  LatestNewsResponse news = controller.news[index];
                  return InkWell(
                    onTap: () => Get.to(
                        NewsDetailsScreen(slug: controller.news[index].slug)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultPadding / 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(defaultPadding / 2),
                                topRight: Radius.circular(defaultPadding / 2)),
                            child: Image.network(
                              news.image ??
                                  "https://media.istockphoto.com/vectors/breaking-news-background-vector-id1056033100?k=20&m=1056033100&s=612x612&w=0&h=Y67goQjL1CFXQbAocoktdvNSVJoSp3NEnb1gMjSXTbA=",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: defaultPadding / 2),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding / 2),
                            child: Text(
                              news.title,
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding / 2),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.calendar_month_rounded,
                                      size: 18,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " ${news.date}",
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
