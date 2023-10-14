// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import './BookingReceptTable.dart';
import '../widgets/BookingReceiptPDF.dart';

class BookingReceiptScreen extends StatelessWidget {
  const BookingReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          titleSpacing: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Booking Receipt"),
        ),
        floatingActionButton: TextButton(
            onPressed: () async {
              final pdfFile = await BookingReceiptPDF.generatePDF();

              BookingReceiptPDF.openFile(pdfFile);
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              primary: Colors.white,
              elevation: 10,
            ),
            child: const Text("Download")),
        body: Container(
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
                        "SH6-170722-034844-065200",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
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
                        numToMonth("17/07/2022"),
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
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
                        numToMonth("17/07/2022"),
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
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
                        numToMonth("17/07/2022"),
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
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
                        "0013168727",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
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
                        "Try US-Cozy - 30 Day",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
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
                        "Old Member",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
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
                        "Student",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
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
                            child: Icon(Icons.account_circle_outlined,
                                size: 16, color: Colors.grey.shade600)),
                        TextSpan(
                            text: " Muhammed Emtiaz Palas",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12))
                      ])),
                      const SizedBox(height: defaultPadding / 4),
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.location_on_outlined,
                                size: 16, color: Colors.grey.shade600)),
                        TextSpan(
                            text: " Pahartali, Khulshi, Chittagram",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12))
                      ])),
                      const SizedBox(height: defaultPadding / 4),
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.mail_outline,
                                size: 16, color: Colors.grey.shade600)),
                        TextSpan(
                            text: " palasemtiaz7@gmail.com",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12))
                      ])),
                      const SizedBox(height: defaultPadding / 4),
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.call_outlined,
                                size: 16, color: Colors.grey.shade600)),
                        TextSpan(
                            text: " 01881657005",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12))
                      ])),
                      const SizedBox(height: defaultPadding / 4),
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.bed_outlined,
                                size: 16, color: Colors.grey.shade700)),
                        TextSpan(
                            text: " A4R1SD1",
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))
                      ])),
                      const SizedBox(height: defaultPadding / 4),
                    ],
                  ),
                  Column(
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
                        "Md. Abdul Kader",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
                      ),
                      Text(
                        "72092",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const BookingReceptTable(),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.check_box_outlined,
                                size: 16, color: Colors.grey.shade600)),
                        TextSpan(
                            text: " Cash",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12)),
                        TextSpan(
                            text: " BDT 1,000",
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))
                      ])),
                      const SizedBox(
                        height: defaultPadding / 2,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.check_box_outlined,
                                size: 16, color: Colors.grey.shade600)),
                        TextSpan(
                            text: " Mobile Banking",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12)),
                        TextSpan(
                            text: " BDT 12,000",
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))
                      ])),
                    ],
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
                                color: Colors.grey.shade600, fontSize: 12)),
                        const TextSpan(
                            text: " Full Payment",
                            style: TextStyle(
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
                                color: Colors.grey.shade600, fontSize: 12)),
                        const TextSpan(
                            text: " 30 Days",
                            style: TextStyle(
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
                    style: TextStyle(color: Colors.green[800], fontSize: 12),
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
        ),
      ),
    );
  }
}
