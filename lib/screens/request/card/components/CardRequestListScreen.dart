// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/request/card/bloc/CardChangeRequestController.dart';
import 'package:super_home_member/screens/request/card/models/card_change_response.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../components/CardChangeRequestScreen.dart';

class CardRequestListScreen extends StatelessWidget {
  CardRequestListScreen({Key? key}) : super(key: key);
  final controller = Get.put(CardChangeRequestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight: 35,
          title: Text("Card Change Request List"), centerTitle: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TextButton.icon(
          style: TextButton.styleFrom(
            elevation: 5,
            backgroundColor: Colors.teal[300],
            primary: Colors.white,
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding / 1.2),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          onPressed: (() => Get.to(const CardChangeRequestScreen())),
          icon: const Icon(Icons.credit_card, size: 18),
          label: Text("Change Request",style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w800),)),
      body: GetBuilder<CardChangeRequestController>(
        init: CardChangeRequestController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const SizedBox();
          }
          if (controller.cards.isEmpty) {
            return const Center(
              child: Text("Data Not Found!"),
            );
          }
          return Container(
            padding: defaultPaddingEdge,
            child: ListView.builder(
              itemCount: controller.cards.length,
              itemBuilder: (context, index) {
                return requestedListContainer(controller.cards[index]);
              },
            ),
          );
        },
      ),
    );
  }

  Widget requestedListContainer(CardChangeResponce card) {
    return Container(
      padding: defaultPaddingEdge,
      margin: const EdgeInsets.only(bottom: defaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultPadding / 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                numToMonth(card.date.toString()),
                style: TextStyle(color: Colors.grey.shade700),
              ),
              Visibility(
                visible: card.status == 0,
                child: InkWell(
                  onTap: () => controller.delete(card.id),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Text(
            "Note",
            style: TextStyle(
                color: Colors.grey.shade700, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            card.note.toString(),
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }
}
