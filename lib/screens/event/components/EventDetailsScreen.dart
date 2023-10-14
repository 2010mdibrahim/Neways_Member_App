import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/event/bloc/EventController.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
        init: EventController(),
        builder: (controller) {
          return Scaffold(
            appBar: buildAppBar(
              title: "${controller.event.title} Event",
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: defaultPaddingEdge,
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
                          controller.event.image.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                controller.event.title.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: defaultPadding),
                            TextButton.icon(
                                style: TextButton.styleFrom(
                                  primary: controller.isInterested
                                      ? Colors.white
                                      : primaryColor,
                                  backgroundColor: controller.isInterested
                                      ? primaryColor
                                      : Colors.white,
                                  side: const BorderSide(color: primaryColor),
                                ),
                                onPressed: () => controller.onClickInterested(),
                                icon: const Icon(Icons.star_border, size: 18),
                                label: const Text("Interested"))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: defaultPadding / 2,
                          right: defaultPadding / 2,
                          bottom: defaultPadding / 2,
                        ),
                        child: Text(
                          controller.event.description.toString(),
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
