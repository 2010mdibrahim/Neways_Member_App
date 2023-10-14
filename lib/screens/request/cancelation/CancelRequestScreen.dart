// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import './bloc/CancelRequestController.dart';

class CancelRequestScreen extends StatelessWidget {
  String title;
  CancelRequestScreen({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Back'),
      body: GetBuilder<CancelRequestController>(
          init: CancelRequestController(),
          builder: (controller) {
            return Padding(
              padding: defaultPaddingEdge,
              child: ListView(children: [
                const SizedBox(height: defaultPadding),
                Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700),
                ),
                const Divider(color: Colors.white, thickness: 2),
                Text(
                  "Request Date",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
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
                      borderRadius: BorderRadius.circular(defaultPadding / 4),
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
                              color: Colors.grey.shade800, fontSize: 14))
                    ])),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Month",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                ),
                const SizedBox(height: defaultPadding / 2),
                InkWell(
                  onTap: () async {
                    await controller.pickMonth(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(defaultPadding / 4),
                    ),
                    child: Text(
                        ' ${getMonth(controller.month.month, isFullName: true)}',
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 14)),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Reason of Cancel",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                ),
                const SizedBox(height: defaultPadding / 2),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                  ),
                  child: TextField(
                    controller: controller.note,
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(defaultPadding / 2),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter cancel reason",
                      hintStyle:
                          TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Deposit Back",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "Request for give your deposit money back to",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic),
                ),
                // const SizedBox(height: defaultPadding / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: controller.isBank,
                            onChanged: (value) =>
                                controller.checkBankStatus(value)),
                        const Text("Bank")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: controller.isBkash,
                            onChanged: (value) =>
                                controller.checkBkashStatus(value)),
                        const Text("Bkash")
                      ],
                    ),
                  ],
                ),
                Visibility(
                  visible: controller.isBank,
                  child: Container(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius:
                            BorderRadius.circular(defaultPadding / 4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account Holder Name",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
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
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.all(defaultPadding / 2),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter account holder name",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "Account Number",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
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
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.all(defaultPadding / 2),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter account number",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "Bank Name",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
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
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.all(defaultPadding / 2),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter bank name",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "Branch",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
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
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.all(defaultPadding / 2),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter branch",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "District",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
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
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.all(defaultPadding / 2),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter district name",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "Routing Number",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
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
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.all(defaultPadding / 2),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Enter routing number",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: controller.isBkash,
                    child: Container(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              BorderRadius.circular(defaultPadding / 4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bkash Number",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade700),
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
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.all(defaultPadding / 2),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Enter bkash number",
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 14),
                              ),
                            ),
                          ),
                          const SizedBox(height: defaultPadding / 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Is Personal"),
                              Checkbox(
                                  value: controller.isPersonal,
                                  onChanged: (value) =>
                                      controller.checkIsPersonalStatus(value)),
                            ],
                          ),
                        ],
                      ),
                    )),
                const Text(
                  "*Member Cancelation Option Currently Unavailable. Please contact the front desk",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: defaultPadding),
                TextButton(
                  onPressed: () {
                    Get.snackbar(
                      'Sorry',
                      "Member Cancelation Option Currently Unavailable. Please contact the front desk",
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(8),
                      backgroundColor: Colors.black,
                    );
                  },
                  child: Text('Request Submit'.toUpperCase()),
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      primary: Colors.white,
                      padding: const EdgeInsets.all(defaultPadding)),
                )
              ]),
            );
          }),
    );
  }
}
