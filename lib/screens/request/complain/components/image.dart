// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/request/complain/bloc/ComplainController.dart';

class ImageUpload extends StatelessWidget {
  ComplainController controller =
      Get.put<ComplainController>(ComplainController());

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
    return GetBuilder<ComplainController>(
        init: ComplainController(),
        builder: (controller) {
          return Column(
            children: [
              SizedBox(
                height: controller.base64Images.isNotEmpty ? 200 : 0,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.base64Images.length,
                  itemBuilder: ((context, index) {
                    Uint8List bytes =
                        base64.decode(controller.base64Images[index]);
                    return Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 4),
                            child: Image.memory(
                              bytes,
                              fit: BoxFit.cover,
                              height: 160,
                            ),
                          ),
                          Positioned(
                            right: -5,
                            top: -5,
                            child: InkWell(
                              onTap: () => controller.deleteImage(index),
                              child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Icon(Icons.close,
                                      color: Colors.white, size: 16)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              InkWell(
                onTap: () {
                  _onAlertPress(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(
          color: Colors.cyan[100],
                    borderRadius: BorderRadius.circular(defaultPadding / 4),
                    // border: Border.all(color: Colors.red),
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
