// ignore_for_file: file_names
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_home_member/screens/chat_with_us/chat_complain/chat_models/complain_category_responce.dart';
import 'package:super_home_member/screens/chat_with_us/chat_complain/chat_models/complain_request.dart';
import 'package:super_home_member/screens/chat_with_us/chat_complain/chat_services/complain_api_service.dart';


class ComplainController extends GetxController {
  List<ComplainCategoryResponce> categories = [];
  List<String> categorieNames = [];
  DateTime date = DateTime.now();
  TextEditingController note = TextEditingController();
  String selectedCategory = "Select Complain Category";
  late String categoryId;
  final box = GetStorage();
  bool isLoading = false;

  // image upload ...
  final ImagePicker _picker = ImagePicker();

  late File file;
  List base64Images = [];

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  getCategories() async {
    isLoading = true;
    await EasyLoading.show();
    await ComplainAPIService.getAllCategory().then((value) {
      if (value.runtimeType == List<ComplainCategoryResponce>) {
        // categories = value;
        categorieNames.add('Select Complain Category');
        value.forEach((element) {
          categorieNames.add(element.name + '-' + element.id.toString());
        });
      } else {}
    });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }

  submit() async {
    if (selectedCategory == "Select Complain Category") {
      Get.snackbar(
        'Wrong',
        "Complain Category must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    if (note.text.isEmpty) {
      Get.snackbar(
        'Wrong',
        "Compllain Reason field must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    await ComplainAPIService.submit(
        data: ComplainRequest(
      memberId: box.read('id'),
      cardPhone: box.read('cardNumber'),
      categoryId: categoryId,
      files: base64Images,
      note: note.text,
      createdAt: date.millisecondsSinceEpoch,
    ));

    EasyLoading.dismiss();
    return true;
  }

  Future pickDate(BuildContext context, {DateTime? initialDate}) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      // firstDate: DateTime.now().subtract(const Duration(days: 0)),
      firstDate: DateTime(DateTime.now().year - (DateTime.now().year - 2000)),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (newDate == null) return;
    // return '${date.day}/${date.month}/${date.year}';
    date = newDate;
    update();
    return newDate;
  }

  selectCategory(value) {
    selectedCategory = value;
    if (selectedCategory != "Select Complain Category") {
      categoryId = selectedCategory.split('-')[1];
    }
    update();
  }

  // image upload ...
  deleteImage(index) {
    base64Images.removeAt(index);
    update();
  }

  // ================================= Image from camera
  Future getCameraImage(context) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    file = File(photo!.path);
    var base64Image = base64Encode(file.readAsBytesSync());
    base64Images.add(base64Image);
    Navigator.pop(context);
    update();
  }

  //============================== Image from gallery
  Future getGalleryImage(context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    file = File(image!.path);
    var base64Image = base64Encode(file.readAsBytesSync());
    base64Images.add(base64Image);
    Navigator.pop(context);
    update();
  }
}
