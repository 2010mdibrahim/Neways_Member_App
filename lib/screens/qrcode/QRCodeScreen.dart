// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/qrcode/bloc/QRCodeController.dart';

class QRCodeScreen extends StatelessWidget {
  QRCodeScreen({Key? key}) : super(key: key);
  final controller = Get.put(QRCodeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => controller.scanQR(),
                    child: const Text('Start QR scan')),
                Text('Scan result : ${controller.scanQRcode}\n',
                    style: const TextStyle(fontSize: 20))
              ])),
    );
  }
}
