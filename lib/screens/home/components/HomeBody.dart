// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/auth/bloc/AuthController.dart';
import 'package:super_home_member/screens/home/components/ActivitiesSection.dart';
import 'package:super_home_member/screens/home/components/AppbarProfileSection.dart';
import 'package:super_home_member/screens/home/components/FacilitiesSection.dart';
import 'package:super_home_member/screens/home/components/MemberProfileSection.dart';
import 'package:super_home_member/screens/home/components/NewsSection.dart';
import 'package:super_home_member/screens/home/components/OthersActivitiesSection.dart';
import 'package:super_home_member/screens/home/components/SliderAdsImage.dart';
import 'package:super_home_member/screens/home/components/WelcomeSection.dart';
import 'package:super_home_member/screens/home/components/WifiSection.dart';
import 'package:super_home_member/screens/widgets/MySideNavigationBar.dart';
import '../../chat_with_us/chat_button.dart';
import '../../chat_with_us/chat_complain/chat_components/ComplainScreen.dart';

// ignore: must_be_immutable
class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        SingleChildScrollView(
          controller: scrollController,
          child: GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const RemaingDaySection(),
                    Visibility(
                        visible: controller.isLogin,
                        child: const AppbarProfileSection()
                    ),
                    Visibility(
                        visible: controller.isLogin,
                        child: MemberProfileSection(
                            scrollController: scrollController)),
                    Visibility(
                        visible: !controller.isLogin,
                        child: const WelcomeSection()),
                    ActivitiesSection(scrollController: scrollController),
                    WifiSection(),
                    const SliderAdsImage(),
                    OthersActivitiesSection(scrollController: scrollController),
                    // RecentActivitiesSection(scrollController: scrollController),
                    NewsSection(scrollController: scrollController),
                    FacilitiesSection(scrollController: scrollController),
                    ChatWithUs(scrollController: scrollController),

                  ],
                );
              }),
        ),
        const MySideNavigationBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomAppBar(
            // shape: widget.notchedShape,
            // color: Colors.green,
            // notchMargin: widget.floatingMargin,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) =>  ComplainListScreen()
                      builder: (context) => const ComplainScreen()
                  ),
                );
              },
              child: Container(
                  height: 50,
                  width:  MediaQuery.of(context).size.width * 1,
                  // margin: defaultPaddingEdge,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Center(child: Text('Chat With Us'.toUpperCase(),style: const TextStyle(fontSize: 15,
                    fontWeight: FontWeight.bold,color: Colors.white,
                    fontFamily: 'CeraProBol'
                    ),
                  ))
              ),
            ),
          ),
        ),
      ],
    );
  }
}
