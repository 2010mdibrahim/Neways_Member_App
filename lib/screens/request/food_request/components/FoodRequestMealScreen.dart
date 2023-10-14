// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/request/food_request/bloc/FoodRequestController.dart';
import 'package:super_home_member/screens/request/food_request/components/MealRequestScreen.dart';
import 'package:super_home_member/screens/request/food_request/models/food_request.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class FoodRequestMealScreen extends StatelessWidget {
  const FoodRequestMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 35,
          backgroundColor: Colors.cyan[600],
          title: const Text("Request Meal List"), centerTitle: true
      ),
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
          onPressed: (() => Get.to(const MealRequestScreen())),
          icon: const Icon(
            Icons.fastfood_rounded,
            size: 18,
          ),
          label: const Text("Meal Request",style: TextStyle(fontWeight: FontWeight.w700),)),
      body: GetBuilder<FoodRequestController>(
          init: FoodRequestController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const SizedBox();
            }
            if (controller.foodRequesteds.isEmpty) {
              return const Center(
                child: Text("Data Not Found!"),
              );
            }
            return Container(
                padding: defaultPaddingEdge,
                child: ListView.builder(
                  itemCount: controller.foodRequesteds.length,
                  itemBuilder: (context, index) {
                    return requestedListContainer(
                        controller.foodRequesteds[index]);
                  },
                ));
          }),
    );
  }

  Widget requestedListContainer(FoodRequest food) {
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
                food.mealType,
                style: TextStyle(
                    color: Colors.teal, fontWeight: FontWeight.w800,fontSize: 15),
              ),
              Text(
                numToMonth(food.date.toString()) + " (${food.time})",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
          const Divider(),
          Visibility(
            child: Text(
              "Note",
              style: TextStyle(
                  color: Colors.grey.shade700, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            food.note.toString(),
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }
}
