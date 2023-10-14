// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/profile/bloc/DocumentController.dart';
import 'package:super_home_member/screens/profile/bloc/ProfileController.dart';
import 'package:super_home_member/screens/profile/models/document_response.dart';
import 'package:super_home_member/screens/profile/widgets/CustomeListTile.dart';
import 'package:super_home_member/screens/profile/widgets/DocumentList.dart';

class ProfileTabSection extends StatefulWidget {
  const ProfileTabSection({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileTabSection> createState() => _ProfileTabSectionState();
}

class _ProfileTabSectionState extends State<ProfileTabSection>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<bool> isSelected = [true, false];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return SafeArea(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300))),
                  child: TabBar(
                    controller: _controller,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: primaryColor,
                    unselectedLabelColor: Colors.grey.shade400,
                    indicatorColor: primaryColor,
                    tabs: [
                      Tab(
                        child: Text(
                          'Personal Information'.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Document Information'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: TabBarView(
                    controller: _controller,
                    children: <Widget>[
                      ListView(
                        shrinkWrap: true,
                        controller: controller.scrollController,
                        children: [
                          CustomeListTile(
                              icon: Icons.email_outlined,
                              title: "Email",
                              data: controller.user.email),
                          CustomeListTile(
                              icon: Icons.call,
                              title: "Phone",
                              data: controller.user.phoneNumber
                          ),
                          CustomeListTile(
                              icon: Icons.work_outline,
                              title: "Occupation",
                              data: controller.user.occupation),
                          CustomeListTile(
                              icon: Icons.air_outlined,
                              title: "Religion",
                              data: controller.user.religion),
                          CustomeListTile(
                              icon: Icons.verified_user_outlined,
                              title: "Father Name",
                              data: controller.user.fatherName),
                          CustomeListTile(
                              icon: Icons.credit_card,
                              title: "NID",
                              data: controller.user.motherName),
                          CustomeListTile(
                              icon: Icons.group_outlined,
                              title: "Emergency Name",
                              data: controller.user.emergencyNumber1),
                          CustomeListTile(
                              icon: Icons.call_outlined,
                              title: "Emergency Number",
                              data: controller.user.emergencyNumber2),
                        ],
                      ),
                      GetBuilder<DocumentController>(
                          init: DocumentController(),
                          builder: (docController) {
                            return ListView.builder(
                              controller: controller.scrollController,
                              itemCount: docController.documents.length,
                              itemBuilder: (context, index) {
                                DocumentResponse doc =
                                    docController.documents[index];
                                return DocumentList(
                                    label: doc.type,
                                    onPress: () {
                                      Get.defaultDialog(
                                          radius: defaultPadding / 4,
                                          contentPadding: const EdgeInsets.all(
                                              defaultPadding / 4),
                                          title: doc.type,
                                          middleText: '',
                                          content: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        defaultPadding / 4),
                                                child: Image.network(
                                                  'http://erp.superhomebd.com/super_home/' +
                                                      doc.document,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ));
                                    });
                              },
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
