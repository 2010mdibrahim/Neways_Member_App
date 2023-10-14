// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/pre_register/controller/PreRegisterController.dart';
import 'package:super_home_member/screens/request/complain/bloc/ComplainController.dart';

import '../../widgets/constants.dart';

class ImageUpload extends StatelessWidget {
  PreRegisterController controller =
      Get.put<PreRegisterController>(PreRegisterController());

  ImageUpload({Key? key}) : super(key: key);

  //========================= Gellary / Camera AlerBox
  void _onAlertPress(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/gallery.png',
                      width: 50,
                    ),
                    const Text('Gallery'),
                  ],
                ),
                onPressed: () => controller.getGalleryImage(context),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/upload.png',
                      width: 50,
                    ),
                    const Text('Take Photo'),
                  ],
                ),
                onPressed: () => controller.getCameraImage(context),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreRegisterController>(
        init: PreRegisterController(),
        builder: (controller) {
          Uint8List bytes = base64.decode(controller.base64Image);
          return Column(
            children: [
              SizedBox(
                height: controller.base64Image.isNotEmpty ? 160 : 0,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                    child: Image.memory(
                      bytes,
                      fit: BoxFit.cover,
                      height: 160,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _onAlertPress(context);
                },
                child: Container(

                  padding: const EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(
                    // color: Colors.cyan[100],
                    color: Colors.cyan[200],
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                    // border: Border.all(color: DColors.secondary,),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt,
                        color: primaryColor,
                      ),
                      const SizedBox(width: defaultPadding / 2),
                      Text(
                        'Upload Image'.toUpperCase(),
                        style: const TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
