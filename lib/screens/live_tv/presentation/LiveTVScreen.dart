// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/live_tv/domain/live_tv_stream_model.dart';
import 'package:super_home_member/screens/live_tv/presentation/LiveTVStreamingScreen.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../controller/LiveTVController.dart';

class LiveTVScreen extends StatelessWidget {
  const LiveTVScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(title: "Live TV", centerTitle: true),
      body: SafeArea(
        child: GetBuilder<LiveTVController>(
            init: LiveTVController(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: defaultPadding / 2),
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    child: Wrap(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: controller.isBangladsh
                                  ? primaryColor
                                  : Colors.white,
                              primary: controller.isBangladsh
                                  ? Colors.white
                                  : primaryColor,
                              side: const BorderSide(color: primaryColor)),
                          onPressed: () => controller.setBangladesh(),
                          child: const Text("Bangla"),
                        ),
                        const SizedBox(width: defaultPadding / 2),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: controller.isSports
                                  ? primaryColor
                                  : Colors.white,
                              primary: controller.isSports
                                  ? Colors.white
                                  : primaryColor,
                              side: const BorderSide(color: primaryColor)),
                          onPressed: () => controller.setSports(),
                          child: const Text("Sports"),
                        ),
                        const SizedBox(width: defaultPadding / 2),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: controller.isInfotainment
                                  ? primaryColor
                                  : Colors.white,
                              primary: controller.isInfotainment
                                  ? Colors.white
                                  : primaryColor,
                              side: const BorderSide(color: primaryColor)),
                          onPressed: () => controller.setInfotainment(),
                          child: const Text("Infotainment"),
                        ),
                        const SizedBox(width: defaultPadding / 2),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: controller.isNews
                                  ? primaryColor
                                  : Colors.white,
                              primary: controller.isNews
                                  ? Colors.white
                                  : primaryColor,
                              side: const BorderSide(color: primaryColor)),
                          onPressed: () => controller.setNews(),
                          child: const Text("News"),
                        ),
                        const SizedBox(width: defaultPadding / 2),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: controller.isKidCartoon
                                  ? primaryColor
                                  : Colors.white,
                              primary: controller.isKidCartoon
                                  ? Colors.white
                                  : primaryColor,
                              side: const BorderSide(color: primaryColor)),
                          onPressed: () => controller.setKidCartoon(),
                          child: const Text("Kids & Cartoon"),
                        ),
                        const SizedBox(width: defaultPadding / 2),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: controller.isRelegion
                                    ? primaryColor
                                    : Colors.white,
                                primary: controller.isRelegion
                                    ? Colors.white
                                    : primaryColor,
                                side: const BorderSide(color: primaryColor)),
                            onPressed: () => controller.setRelegion(),
                            child: const Text("Relegion")),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: controller.tvList.length,
                      itemBuilder: (context, index) {
                        LiveTvStreamModel tv = controller.tvList[index];
                        return InkWell(
                          onTap: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LiveTVStreamingScreen(tv: tv)))),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(defaultPadding / 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/tv/${tv.img}",
                                    height: size.width * 0.15,
                                  ),
                                  const SizedBox(height: defaultPadding / 2),
                                  Text(
                                    tv.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(height: defaultPadding / 2),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
