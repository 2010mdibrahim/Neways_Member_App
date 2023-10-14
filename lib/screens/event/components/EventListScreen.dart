import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/event/bloc/EventController.dart';
import 'package:super_home_member/screens/event/components/EventDetailsScreen.dart';
import 'package:super_home_member/screens/event/models/event_response_model.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class EventListScreen extends StatelessWidget {
  const EventListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
        init: EventController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 35,
              backgroundColor: Colors.cyan[600],
              title: Text("${controller.category.categoryName} Event"),
              centerTitle: true,
            ),
            body: Padding(
              padding: defaultPaddingEdge,
              child: ListView.builder(
                itemCount: controller.events.length,
                itemBuilder: (context, index) {
                  EventResponseModel event = controller.events[index];
                  return InkWell(
                    onTap: () {
                      controller.setEvent(event);
                      Get.to(const EventDetailsScreen());
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
                              event.image.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              event.title.toString(),
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
                              event.sortDescription.toString(),
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
            ),
          );
        }
        );
  }
}
