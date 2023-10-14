// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/rental_info/bloc/RentalInfoDetailController.dart';
import 'package:super_home_member/screens/rental_info/models/rentalInfo_details_response.dart';
import 'package:super_home_member/screens/rental_info/widgets/RentalInfoTable.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class RentalDetailsScreen extends StatelessWidget {
  dynamic rentalId;
  RentalDetailsScreen({Key? key, required this.rentalId}) : super(key: key);

  RentalInfoDetailController rentalController =
      Get.put(RentalInfoDetailController());
  @override
  Widget build(BuildContext context) {
    rentalController.setId(rentalId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight: 35,
          title: Text("Rental Details"),centerTitle: true,),
      // floatingActionButton: TextButton(
      //     onPressed: () async {
      //       final pdfFile = await RentalInfoPDF.generatePDF();

      //       RentalInfoPDF.openFile(pdfFile);
      //     },
      //     style: TextButton.styleFrom(
      //       backgroundColor: primaryColor,
      //       primary: Colors.white,
      //       elevation: 10,
      //     ),
      //     child: const Text("Download")),
      body: Obx(
        () {
          if (rentalController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else {
            return GetBuilder<RentalInfoDetailController>(
                init: RentalInfoDetailController(),
                builder: (controller) {
                  return Container(
                    color: Colors.white,
                    padding: defaultPaddingEdge,
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transaction ID".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.rentalInfo.transactionId,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Invoice Date".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  numToMonth(
                                      controller.rentalInfo.invoiceDate),
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Check-IN Date.".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  numToMonth(
                                      controller.rentalInfo.checkinDate),
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Check-Out Date".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.rentalInfo.checkoutDate !=
                                          "Not Confirm Yet"
                                      ? numToMonth(
                                          controller.rentalInfo.checkoutDate)
                                      : controller.rentalInfo.checkoutDate,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Number".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.rentalInfo.cardNo,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Package Category".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.rentalInfo.packageCategory,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Source".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.rentalInfo.source,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Occupation".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.rentalInfo.occupation,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade200,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Invoice To".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: defaultPadding / 3),
                                RichText(
                                    text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(
                                          Icons.account_circle_outlined,
                                          size: 16,
                                          color: Colors.grey.shade600)),
                                  TextSpan(
                                      text:
                                          " ${controller.rentalInfo.memberName}",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12))
                                ])),
                                const SizedBox(height: defaultPadding / 4),


                                ///
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: RichText(
                                      text: TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.location_on_outlined,
                                                size: 16,
                                                color: Colors.grey.shade600)),

                                        TextSpan(
                                          text:
                                          " ${controller.rentalInfo.memberAddress}",
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 12,),)
                                      ],),),
                                ),

                                ///


                                const SizedBox(height: defaultPadding / 4),
                                RichText(
                                    text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(Icons.mail_outline,
                                          size: 16,
                                          color: Colors.grey.shade600)),
                                  TextSpan(
                                    text:
                                        " ${controller.rentalInfo.memberEmail}",
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12),
                                  )
                                ])),
                                const SizedBox(height: defaultPadding / 4),
                                RichText(
                                    text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(Icons.call_outlined,
                                          size: 16,
                                          color: Colors.grey.shade600)),
                                  TextSpan(
                                      text:
                                          " ${controller.rentalInfo.memberPhone}",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12))
                                ])),
                                const SizedBox(height: defaultPadding / 4),
                                RichText(
                                    text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(Icons.bed_outlined,
                                          size: 16,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text:
                                          "BED: ${controller.rentalInfo.bedName}",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                ])),
                                const SizedBox(height: defaultPadding / 4),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Invoice By".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: defaultPadding / 3),
                                  Text(
                                    controller.rentalInfo.employeeName,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    controller.rentalInfo.employeeId,
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: defaultPadding / 2,
                        ),
                        RentalInfoTable(data: controller.rentalInfo),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: PaymentReceivedMethodList(
                                  data: controller.rentalInfo),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Pattern".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "Status",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                  TextSpan(
                                      text:
                                          " ${controller.rentalInfo.paymentPattern}",
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12))
                                ])),
                                const SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "Recharge",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                  TextSpan(
                                      text:
                                          " ${controller.rentalInfo.rechargeDays} Days",
                                      style: const TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12))
                                ])),
                                const SizedBox(
                                  height: defaultPadding / 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Thank you!",
                              style: TextStyle(
                                  color: Colors.green[800], fontSize: 12),
                            ),
                            const SizedBox(
                              height: defaultPadding / 6,
                            ),
                            Text(
                              "Supper Home",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Notice".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              height: defaultPadding / 6,
                            ),
                            Visibility(
                              visible: controller.rentalInfo.notice != '',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.rentalInfo.notice,
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        letterSpacing: .8,
                                        fontSize: 12),
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                            Text(
                              "A finance per day charge of BDT 100/- will be made on unpaid rent after 10 days & New CheckIn after 5 Days.",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  letterSpacing: .8,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: defaultPadding * 3,
                        ),
                      ],
                    )),
                  );
                });
          }
        },
      ),
    );
  }
}

class PaymentReceivedMethodList extends StatelessWidget {
  RentalInfoDetailsResponse data;
  PaymentReceivedMethodList({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Payment Method".toUpperCase(),
        style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: defaultPadding / 2,
      ),
      Visibility(
          visible: data.paymentReceivedMethods.isEmpty,
          child: RichText(
              text: TextSpan(children: [
            WidgetSpan(
                child: Icon(Icons.check_box_outlined,
                    size: 16, color: Colors.grey.shade600)),
            TextSpan(
                text: " ${data.paymentMethod.toString().split('|')[0]}",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
            TextSpan(
                text: " BDT ${data.totalAmount}",
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 12))
          ]))),
      ListView.builder(
        shrinkWrap: true,
        itemCount: data.paymentReceivedMethods.length,
        itemBuilder: (context, index) {
          PaymentReceivedMethod paymentReceivedMethod =
              data.paymentReceivedMethods[index];
          return RichText(
              text: TextSpan(children: [
            WidgetSpan(
                child: Icon(Icons.check_box_outlined,
                    size: 16, color: Colors.grey.shade600)),
            TextSpan(
                text: " ${paymentReceivedMethod.method}",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
            TextSpan(
                text: " BDT ${paymentReceivedMethod.amount}",
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 12))
          ]));
        },
      ),
    ]);
  }
}
