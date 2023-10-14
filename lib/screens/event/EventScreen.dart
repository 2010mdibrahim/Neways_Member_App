import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/event/bloc/EventController.dart';
import 'package:super_home_member/screens/event/components/EventListScreen.dart';
import 'package:super_home_member/screens/event/models/event_category_response_model.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: Text("Events"), centerTitle: true),
      body: GetBuilder<EventController>(
          init: EventController(),
          builder: (controller) {
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView.builder(
                itemCount: controller.eventCategories.length,
                itemBuilder: (context, index) {
                  EventCategoryResponseModel category =
                      controller.eventCategories[index];
                  return InkWell(
                    onTap: () {
                      controller.setCategory(category);
                      Get.to(const EventListScreen());
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultPadding / 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(defaultPadding / 2),
                              topRight: Radius.circular(defaultPadding / 2),
                            ),
                            child: Image.network(
                              category.image.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              category.categoryName.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: defaultPadding / 2,
                              right: defaultPadding / 2,
                              bottom: defaultPadding / 2,
                            ),
                            child: Text(
                              category.sortDescription.toString(),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
