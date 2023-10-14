// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/food_menu/bloc/FoodMenuController.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight: 35,
          title: const Text("Food Menu"),centerTitle: true),
      body: GetBuilder<FoodMenuController>(
          init: FoodMenuController(),
          builder: (controller) {
            // if (controller.isLoading) {
            //   return Container();
            // }
            return SingleChildScrollView(
                child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async => controller.pickDate(context),
                    icon: const Icon(Icons.calendar_month_rounded, size: 20,color: Colors.cyan,),
                    label: Text(numToMonth(
                        '${controller.date.day}/${controller.date.month}/${controller.date.year}'
                    ),style:const TextStyle(color: Colors.cyan,fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                    )
                ),
                const Divider(),
                Card(
                  margin: defaultPaddingEdge,
                  color: Colors.teal,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                  ),
                  child: Container(
                    padding: defaultPaddingEdge,
                    child: Column(
                      children: [
                        const Text(
                          "Breakfast",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        Text(
                          controller.menu.breakfast != null
                              ? controller.menu.breakfast.foodTitle
                              : "Data not found!",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.fastfood,
                                color: Colors.grey.shade100,
                                size: 18,
                              )),
                              WidgetSpan(
                                child: Text(
                                  " Food",
                                  style: TextStyle(
                                      color: Colors.grey.shade100,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Card(
                  margin: defaultPaddingEdge,
                  color: Colors.cyan,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                  ),
                  child: Container(
                    padding: defaultPaddingEdge,
                    child: Column(
                      children: [
                        const Text(
                          "Lunch",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        Text(
                          controller.menu.lunch != null
                              ? controller.menu.lunch.foodTitle
                              : "Data not found!",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.fastfood,
                                color: Colors.grey.shade100,
                                size: 18,
                              )
                              ),
                              WidgetSpan(
                                child: Text(
                                  " Food",
                                  style: TextStyle(
                                      color: Colors.grey.shade100,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Card(
                  margin: defaultPaddingEdge,
                  color: Colors.pink,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                  ),
                  child: Container(
                    padding: defaultPaddingEdge,
                    child: Column(
                      children: [
                        const Text(
                          "Dinner",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        Text(
                          controller.menu.dinner != null
                              ? controller.menu.dinner.foodTitle
                              : "Data not found!",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.fastfood,
                                color: Colors.grey.shade100,
                                size: 18,
                              )),
                              WidgetSpan(
                                child: Text(
                                  " Food",
                                  style: TextStyle(
                                      color: Colors.grey.shade100,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Card(
                  margin: defaultPaddingEdge,
                  color: Colors.orange,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                  ),
                  child: Container(
                    padding: defaultPaddingEdge,
                    child: Column(
                      children: [
                        const Text(
                          "Iftar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        Text(
                          controller.menu.iftar != null
                              ? controller.menu.iftar.foodTitle
                              : "Data not found!",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.fastfood,
                                color: Colors.grey.shade100,
                                size: 18,
                                  )
                              ),
                              WidgetSpan(
                                child: Text(
                                  " Food",
                                  style: TextStyle(
                                      color: Colors.grey.shade100,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Card(
                  margin: defaultPaddingEdge,
                  color: Colors.deepPurple,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                  ),
                  child: Container(
                    padding: defaultPaddingEdge,
                    child: Column(
                      children: [
                        const Text(
                          "Sehri",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        Text(
                          controller.menu.sehri != null
                              ? controller.menu.sehri.foodTitle
                              : "Data not found!",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: defaultPadding / 2),

                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.fastfood, color: Colors.grey.shade100, size: 18,
                              )), WidgetSpan(
                                child: Text(
                                  " Food",
                                  style: TextStyle(
                                      color: Colors.grey.shade100,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                // const Text("abcdefghijklmnopqrstuvwxyz")

              ],
            ));
          }),
    );
  }
}
