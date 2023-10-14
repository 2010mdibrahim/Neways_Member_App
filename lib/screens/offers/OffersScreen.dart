// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/offers/bloc/OfferController.dart';
import 'package:super_home_member/screens/offers/models/offers_response_model.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: Text("Offers"), centerTitle: true),
      body: GetBuilder<OfferController>(
          init: OfferController(),
          builder: (controller) {
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView.builder(
                itemCount: controller.offers.length,
                itemBuilder: (context, index) {
                  OfferResponseModel offer = controller.offers[index];
                  return Card(
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
                            offer.image.toString(),
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
                                  offer.title.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: defaultPadding),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Expiry Date",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade900),
                                  ),
                                  Text(
                                    numToMonth2(offer.validDate.toString()),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          child: Text(
                            offer.description.toString(),
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
