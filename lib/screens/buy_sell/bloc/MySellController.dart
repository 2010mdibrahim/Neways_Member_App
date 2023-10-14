// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_category_response_model.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_details_response_model.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_response_model.dart';
import 'package:super_home_member/screens/buy_sell/services/buy_sell_services.dart';

class MySellController extends GetxController {
  List<BuySellResponseModel> buysells = [];
  late BuySellCategoryResponseModel category;
  List<BuySellCategoryResponseModel> categories = [];
  late BuySellResponseModel buysell;
  late BuySellDetailsResponseModel product;
  String selectedCategory = "Select Category";
  List<String> categorieNames = [];
  bool isLoading = false;

  TextEditingController note = TextEditingController();
  TextEditingController categoryId = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController postedLocation = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController condition = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController features = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  DateTime postedDate = DateTime.now();
  final box = GetStorage();

  // image upload ...
  final ImagePicker _picker = ImagePicker();

  late File file;
  List base64Images = [];
  @override
  void onInit() async {
    super.onInit();
    await getAllPost();
    await getAllCategories();
    postedLocation.text = box.read('branchName');
  }

  getAllPost() async {
    isLoading = true;
    await EasyLoading.show();
    try {
      await BuySellAPIService.getAllMyProduct().then((value) {
        buysells = value;
        print(value.toJson());
        isLoading = false;
        return value;
      });
    } catch (e) {
      print(e);
    }

    EasyLoading.dismiss();
    update();
  }

  getAllCategories() async {
    isLoading = true;
    await EasyLoading.show();
    await BuySellAPIService.getAllCategory().then((value) {
      isLoading = false;
      categorieNames.add('Select Category');
      value.forEach((element) {
        categorieNames
            .add(element.categoryName.toString() + '-' + element.id.toString());
      });
      return value;
    });
    EasyLoading.dismiss();
    update();
  }

  setBuySell(value) {
    buysell = value;
    getBuySellProduct();
    update();
  }

  getBuySellProduct() async {
    isLoading = true;
    await EasyLoading.show();
    try {
      await BuySellAPIService.getProduct(slug: buysell.slug.toString())
          .then((value) {
        product = value;
        isLoading = false;
        return value;
      });
    } catch (e) {
      print(e);
    }

    EasyLoading.dismiss();
    update();
  }

  selectCategory(value) {
    selectedCategory = value;
    if (selectedCategory != "Select Category") {
      categoryId.text = selectedCategory.split('-')[1];
    }
    update();
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
    postedDate = newDate;
    update();
    return newDate;
  }

  submit() async {
    if (selectedCategory == "Select Category") {
      Get.snackbar(
        'Wrong',
        "Category must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    if (title.text.isEmpty) {
      Get.snackbar(
        'Wrong',
        "Product title must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    if (postedLocation.text.isEmpty) {
      Get.snackbar(
        'Wrong',
        "Location must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    if (price.text.isEmpty) {
      Get.snackbar(
        'Wrong',
        "Price must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }

    if (condition.text.isEmpty) {
      Get.snackbar(
        'Wrong',
        "Condition must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    if (phoneNumber.text.isEmpty) {
      Get.snackbar(
        'Wrong',
        "Phone Number must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    await BuySellAPIService.submit(
      data: BuySellDetailsResponseModel(
        title: title.text,
        categoryId: categoryId.text,
        postedDate: "${postedDate.day}/${postedDate.month}/${postedDate.year}",
        price: price.text,
        condition: condition.text,
        brand: brand.text,
        model: model.text,
        phoneNumber: phoneNumber.text,
        features: features.text,
        description: description.text,
        postedLocation: postedLocation.text,
        sellBy: box.read('name'),
        image: base64Images,
      ),
    ).then((value) {
      print(value);
    });

    await getAllPost();
    return true;
  }

  delete(id) async {
    await BuySellAPIService.delete(
      id: id,
    );

    await getAllPost();
    return true;
  }

  updateProduct({id, status}) async {
    await BuySellAPIService.update(
      id: id,
      status: status,
    );

    await getAllPost();
    return true;
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
