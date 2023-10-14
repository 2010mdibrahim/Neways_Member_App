import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/qrcode/components/EmployeeReviewScreen.dart';
import 'package:super_home_member/screens/qrcode/models/employee_model.dart';
import 'package:super_home_member/screens/qrcode/services/qr_code_services.dart';

class QRCodeController extends GetxController {
  String scanQRcode = 'Unknown';
  final box = GetStorage();
  late EmployeeModel employee;
  late double rating = 2.5;
  late Icon icon = const Icon(
    Icons.sentiment_neutral,
    color: Colors.amber,
    size: 100,
  );
  TextEditingController noteController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  Future<void> scanQR() async {
    String qrCodeScanRes;
    try {
      qrCodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      dynamic links = qrCodeScanRes.split('/qr-code');
      links = links[0].toString();
      if (links == "http://erp.superhomebd.com/super_home/employee-rating") {
        String url = qrCodeScanRes;
        await QRCodeAPIService.getEmployee(url: url).then((value) {
          if (value.runtimeType == EmployeeModel) {
            employee = value;
            update();
            Get.to(const EmployeeReviewScreen());
          }
        });
      }
    } on PlatformException {
      qrCodeScanRes = 'Failed to get platform version.';
    }
    // if (!mounted) return;

    scanQRcode = qrCodeScanRes;
    update();
    return;
  }

  setRating(value) {
    rating = value;
    if (rating == 1.0) {
      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red,
        size: 120,
      );
    } else if (rating == 1.5 || rating == 2.0) {
      icon = const Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.redAccent,
        size: 120,
      );
    } else if (rating == 2.5 || rating == 3.0) {
      icon = const Icon(
        Icons.sentiment_neutral,
        color: Colors.amber,
        size: 120,
      );
    } else if (rating == 3.5 || rating == 4.0) {
      icon = const Icon(
        Icons.sentiment_satisfied,
        color: Colors.lightGreen,
        size: 120,
      );
    } else {
      icon = const Icon(
        Icons.sentiment_very_satisfied,
        color: Colors.green,
        size: 120,
      );
    }
    update();
  }

  submit() async {
    bool isLogin = box.read('login') ?? false;
    if (!isLogin) {
      await Get.defaultDialog(
        radius: 5,
        title: "Phone / Card Number",
        content: Column(
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(defaultPadding / 4),
              ),
              child: TextField(
                controller: numberController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(defaultPadding / 2),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Please enter your phone / card number",
                  hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Get.back(),
                    child: Text('Cancel'.toUpperCase()),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        primary: Colors.white,
                        padding: const EdgeInsets.all(defaultPadding / 2)),
                  ),
                ),
                const SizedBox(width: defaultPadding / 2),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      if (numberController.text.isNotEmpty) {
                        await EasyLoading.show();
                        await QRCodeAPIService.checkNumber(
                                url: scanQRcode,
                                phoneNumber: numberController.text)
                            .then((value) async {
                          Map<String, dynamic> data = {
                            'branch_id': value['branch_id'],
                            'receiver_id': value['receiver_id'],
                            'user_type': value['user_type'],
                            'phone_number': numberController.text,
                            'stars': rating,
                            'employee_id': employee.employeeId,
                            'note': noteController.text
                          };
                          return await QRCodeAPIService.submitReview(
                              url: scanQRcode, data: data);
                        });
                        numberController.clear();
                        noteController.clear();
                        rating = 2.5;
                        EasyLoading.dismiss();
                        Get.back();
                      }
                    },
                    child: Text('Save'.toUpperCase()),
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        primary: Colors.white,
                        padding: const EdgeInsets.all(defaultPadding / 2)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      return true;
    } else {
      await EasyLoading.show();
      await QRCodeAPIService.checkNumber(
              url: scanQRcode, phoneNumber: box.read('cardNumber'))
          .then((value) async {
        Map<String, dynamic> data = {
          'branch_id': value['branch_id'],
          'receiver_id': value['receiver_id'],
          'user_type': value['user_type'],
          'phone_number': box.read('cardNumber'),
          'stars': rating,
          'employee_id': employee.employeeId,
          'note': noteController.text
        };
        return await QRCodeAPIService.submitReview(url: scanQRcode, data: data);
      });
      EasyLoading.dismiss();
      numberController.clear();
      noteController.clear();
      rating = 2.5;
      return true;
    }
  }
}
