// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}

class RentalInfoPDF {
  static Future generatePDF() async {
    final pdf = Document();
    final imageJpg =
        (await rootBundle.load('assets/images/super-home-logo.png'))
            .buffer
            .asUint8List();
    final materialIcons =
        await rootBundle.load("assets/fonts/materialIcons.ttf");

    final materialIconsTtf = pw.Font.ttf(materialIcons);
    var pageTheme = pw.PageTheme(
      theme: pw.ThemeData.withFont(
        icons: materialIconsTtf,
      ),
    );
    pdf.addPage(MultiPage(
      pageTheme: pageTheme,
      build: (context) => [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 65,
                          height: 65,
                          child: Image(MemoryImage(imageJpg))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Super Home".toUpperCase(),
                            style: TextStyle(
                                color: PdfColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Super Home 6 Baridhara",
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                color: PdfColors.black, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: PdfColors.grey,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(text: " (+880) 96386-66333"),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: PdfColors.grey,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(text: " info@superhomebd.com"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Rental Receipt".toUpperCase(),
            style:
                TextStyle(fontWeight: FontWeight.bold, color: PdfColors.grey),
          ),
        ),
        SizedBox(
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
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "SH6-170722-034844-065200",
                  style: const TextStyle(color: PdfColors.grey, fontSize: 12),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Invoice Date".toUpperCase(),
                  style: TextStyle(
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  numToMonth("17/07/2022"),
                  style: const TextStyle(color: PdfColors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
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
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  numToMonth("17/07/2022"),
                  style: const TextStyle(color: PdfColors.grey, fontSize: 12),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Check-Out Date".toUpperCase(),
                  style: TextStyle(
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  numToMonth("17/07/2022"),
                  style: const TextStyle(color: PdfColors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
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
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "0013168727",
                  style: const TextStyle(color: PdfColors.grey, fontSize: 12),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Package Category".toUpperCase(),
                  style: TextStyle(
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Try US-Cozy - 30 Day",
                  style: const TextStyle(color: PdfColors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
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
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Old Member",
                  style: const TextStyle(color: PdfColors.grey, fontSize: 12),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Occupation".toUpperCase(),
                  style: TextStyle(
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Student",
                  style: const TextStyle(color: PdfColors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: PdfColors.grey200,
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
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: defaultPadding / 3),
                RichText(
                    text: const TextSpan(children: [
                  // WidgetSpan(
                  //     child: Icon(
                  //         IconData(mt.Icons.account_circle_outlined.codePoint),
                  //         size: 16,
                  //         color: PdfColors.grey)),
                  TextSpan(
                      text: " Muhammed Emtiaz Palas",
                      style: TextStyle(color: PdfColors.grey, fontSize: 12))
                ])),
                SizedBox(height: defaultPadding / 4),
                RichText(
                    text: const TextSpan(children: [
                  // WidgetSpan(
                  //     child: Icon(
                  //         IconData(mt.Icons.location_on_outlined.codePoint),
                  //         size: 16,
                  //         color: PdfColors.grey)),
                  TextSpan(
                      text: " Pahartali, Khulshi, Chittagram",
                      style: TextStyle(color: PdfColors.grey, fontSize: 12))
                ])),
                SizedBox(height: defaultPadding / 4),
                RichText(
                    text: const TextSpan(children: [
                  // WidgetSpan(
                  //     child: Icon(IconData(mt.Icons.mail_outline.codePoint),
                  //         size: 16, color: PdfColors.grey)),
                  TextSpan(
                      text: " palasemtiaz7@gmail.com",
                      style: TextStyle(color: PdfColors.grey, fontSize: 12))
                ])),
                SizedBox(height: defaultPadding / 4),
                RichText(
                    text: const TextSpan(children: [
                  // WidgetSpan(
                  //     child: Icon(IconData(mt.Icons.call_outlined.codePoint),
                  //         size: 16, color: PdfColors.grey)),
                  TextSpan(
                      text: " 01881657005",
                      style: TextStyle(color: PdfColors.grey, fontSize: 12))
                ])),
                SizedBox(height: defaultPadding / 4),
                RichText(
                    text: TextSpan(children: [
                  // WidgetSpan(
                  //     child: Icon(IconData(mt.Icons.bed_outlined.codePoint),
                  //         size: 16, color: PdfColors.grey700)),
                  TextSpan(
                      text: " A4R1SD1",
                      style: TextStyle(
                          color: PdfColors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold))
                ])),
                SizedBox(height: defaultPadding / 4),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Invoice By".toUpperCase(),
                  style: TextStyle(
                      color: PdfColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: defaultPadding / 3),
                Text(
                  "Md. Abdul Kader",
                  style: const TextStyle(color: PdfColors.grey, fontSize: 12),
                ),
                Text(
                  "72092",
                  style: TextStyle(
                      color: PdfColors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: defaultPadding / 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              color: PdfColors.blue200,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "#".toUpperCase(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: PdfColors.grey800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Type".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: PdfColors.grey800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Unit Price".toUpperCase(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: PdfColors.grey800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Total".toUpperCase(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: PdfColors.grey800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                  color: PdfColors.blue100,
                  border: Border(bottom: BorderSide(color: PdfColors.white))),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Rent",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PdfColors.grey800,
                          fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Diamond",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 6,999",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 6,999",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: PdfColors.grey800,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                  color: PdfColors.blue100,
                  border: Border(bottom: BorderSide(color: PdfColors.white))),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Purchase",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PdfColors.grey800,
                          fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "---",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 0.00",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 0.00",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: PdfColors.grey800,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                  color: PdfColors.blue100,
                  border: Border(bottom: BorderSide(color: PdfColors.white))),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Electricity Bill",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PdfColors.grey800,
                          fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "----",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 401",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 401",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: PdfColors.grey800,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                  color: PdfColors.blue100,
                  border: Border(bottom: BorderSide(color: PdfColors.white))),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Penalty",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PdfColors.grey800,
                          fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "----",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 0.00	",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 0.00",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: PdfColors.grey800,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                  color: PdfColors.blue100,
                  border: Border(bottom: BorderSide(color: PdfColors.white))),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Locker",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PdfColors.grey800,
                          fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "----",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 0.00",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 0.00",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: PdfColors.grey800,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                  color: PdfColors.blue100,
                  border: Border(bottom: BorderSide(color: PdfColors.white))),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Parking",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PdfColors.grey800,
                          fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "----",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 0.00",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 0.00",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: PdfColors.grey800,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding / 2),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: PdfColors.grey800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "SubTotal",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 7,400".toUpperCase(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: PdfColors.grey800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: PdfColors.grey800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Cash Back",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: PdfColors.grey800, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 0.00".toUpperCase(),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: PdfColors.grey500, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: PdfColors.grey800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "GRAND TOTAL".toUpperCase(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: PdfColors.grey800,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "BDT 7,400".toUpperCase(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: PdfColors.grey800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
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
                      color: PdfColors.grey700,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                RichText(
                    text: TextSpan(children: [
                  // WidgetSpan(
                  //     child: Icon(
                  //         IconData(mt.Icons.check_box_outlined.codePoint),
                  //         size: 16,
                  //         color: PdfColors.grey)),
                  const TextSpan(
                      text: " Cash",
                      style: TextStyle(color: PdfColors.grey, fontSize: 12)),
                  TextSpan(
                      text: " BDT 1,000",
                      style: TextStyle(
                          color: PdfColors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12))
                ])),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                RichText(
                    text: TextSpan(children: [
                  // WidgetSpan(
                  //     child: Icon(
                  //         IconData(mt.Icons.check_box_outlined.codePoint),
                  //         size: 16,
                  //         color: PdfColors.grey)),
                  const TextSpan(
                      text: " Mobile Banking",
                      style: TextStyle(color: PdfColors.grey, fontSize: 12)),
                  TextSpan(
                      text: " BDT 6,400",
                      style: TextStyle(
                          color: PdfColors.grey,
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
                      color: PdfColors.grey700,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Status",
                      style: TextStyle(color: PdfColors.grey, fontSize: 12)),
                  TextSpan(
                      text: " Full Payment",
                      style: TextStyle(
                          color: PdfColors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 12))
                ])),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Recharge",
                      style: TextStyle(color: PdfColors.grey, fontSize: 12)),
                  TextSpan(
                      text: " 30 Days",
                      style: TextStyle(
                          color: PdfColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12))
                ])),
                SizedBox(
                  height: defaultPadding / 2,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thank you!",
              style: const TextStyle(color: PdfColors.green800, fontSize: 12),
            ),
            SizedBox(
              height: defaultPadding / 6,
            ),
            Text(
              "Supper Home",
              style: TextStyle(
                  color: PdfColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: defaultPadding / 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notice".toUpperCase(),
              style: TextStyle(
                  color: PdfColors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  fontSize: 12),
            ),
            SizedBox(
              height: defaultPadding / 6,
            ),
            Text(
              "A finance per day charge of BDT 100/- will be made on unpaid rent after 10 days & New CheckIn after 5 Days.",
              style: const TextStyle(
                  color: PdfColors.black, letterSpacing: .8, fontSize: 12),
            ),
          ],
        ),
        // SizedBox(
        //   height: defaultPadding * 3,
        // ),
      ],
    ));

    return saveDocument(
        name: 'booking_receipt_${DateTime.now()}.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
