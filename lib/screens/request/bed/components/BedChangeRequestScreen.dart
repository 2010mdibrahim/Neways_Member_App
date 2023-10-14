// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import '../bloc/BedChangeController.dart';
import '../components/FindAvailableBedScreen.dart';

class BedChangeRequestScreen extends StatelessWidget {
  const BedChangeRequestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Back'),
      body: GetBuilder<BedChangeController>(
          init: BedChangeController(),
          builder: (controller) {
            if (controller.isLoading) {
              return Container();
            }
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView(
                children: [
                  const SizedBox(height: defaultPadding),
                  Text(
                    "Bed Change Request".toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  const Divider(
                      color: Colors.white,
                      thickness: 2,
                      height: defaultPadding),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    "Current Bed",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Container(
                      padding: defaultPaddingEdge,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              BorderRadius.circular(defaultPadding / 2)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Branch Name",
                                      style: TextStyle(
                                          color: Colors.grey.shade800),
                                    ),
                                    Text(
                                      controller.currentBed.branchName
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Floor Name",
                                      style: TextStyle(
                                          color: Colors.grey.shade800),
                                    ),
                                    Text(
                                      controller.currentBed.floorName
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Unit Name",
                                    style:
                                        TextStyle(color: Colors.grey.shade800),
                                  ),
                                  Text(
                                    controller.currentBed.unitName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Room Name",
                                    style:
                                        TextStyle(color: Colors.grey.shade700),
                                  ),
                                  Text(
                                    controller.currentBed.roomName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    "Bed",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(defaultPadding / 4),
                    ),
                    child: TextFormField(
                      initialValue: controller.currentBed.bedName,
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.all(defaultPadding / 2),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: "Enter current bed name",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Visibility(
                    visible: controller.isSelectBed,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Request Bed",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () =>
                                    Get.to(const FindAvailableBedScreen()),
                                child: const Text("Change"))
                          ],
                        ),
                        // const SizedBox(height: defaultPadding / 4),
                        Container(
                            padding: defaultPaddingEdge,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:
                                    BorderRadius.circular(defaultPadding / 2)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Branch Name",
                                            style: TextStyle(
                                                color: Colors.grey.shade800),
                                          ),
                                          Text(
                                            controller.currentBed.branchName
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade800),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Floor Name",
                                            style: TextStyle(
                                                color: Colors.grey.shade800),
                                          ),
                                          Text(
                                            controller.changeableBed.floorName
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade800),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Unit Name",
                                          style: TextStyle(
                                              color: Colors.grey.shade800),
                                        ),
                                        Text(
                                          controller.changeableBed.unitName
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade800),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Room Name",
                                          style: TextStyle(
                                              color: Colors.grey.shade700),
                                        ),
                                        Text(
                                          controller.changeableBed.roomName
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )),
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "Bed",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 4),
                          ),
                          child: TextFormField(
                            initialValue:
                                controller.changeableBed.bedName.toString(),
                            readOnly: true,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.all(defaultPadding / 2),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter request bed name",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "Request Date",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        InkWell(
                          onTap: () async {
                            await controller.pickDate(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(defaultPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(defaultPadding / 4),
                            ),
                            child: RichText(
                                text: TextSpan(children: [
                              const WidgetSpan(
                                child: Icon(
                                  Icons.calendar_month_rounded,
                                  color: primaryColor,
                                  size: 18,
                                ),
                              ),
                              TextSpan(
                                  text:
                                      ' ${numToMonth("${controller.date.day}/${controller.date.month}/${controller.date.year}")}',
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 14))
                            ])),
                          ),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "Note",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 4),
                          ),
                          child: TextField(
                            controller: controller.note,
                            keyboardType: TextInputType.text,
                            maxLines: 5,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.all(defaultPadding / 2),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter note details",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () async {
                              await EasyLoading.show(status: "Uploding...");
                              var status = await controller.submit();
                              if (status == true) {
                                Get.back();
                                Get.snackbar(
                                  'Success',
                                  "Bed Change Request Submit Successfull",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  margin: const EdgeInsets.all(8),
                                  backgroundColor: Colors.black,
                                );
                              }
                            },
                            child: Text('Request Submit'.toUpperCase()),
                            style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                primary: Colors.white,
                                padding: const EdgeInsets.all(defaultPadding)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !controller.isSelectBed,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        icon: const Icon(Icons.search_rounded),
                        onPressed: () => Get.to(const FindAvailableBedScreen()),
                        label: const Text('Find Available Bed'),
                        style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            primary: Colors.white,
                            padding: const EdgeInsets.all(defaultPadding / 2)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
