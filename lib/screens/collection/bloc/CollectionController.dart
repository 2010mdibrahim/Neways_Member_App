// ignore_for_file: file_names
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/collection/services/collection_api_service.dart';
import '../models/collection_response.dart';

class CollectionController extends GetxController {
  List<CollectionResponse> collections = <CollectionResponse>[];
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    await getAllCollections();
  }

  getAllCollections() async {
    isLoading = true;
    await EasyLoading.show();
    isLoading = true;
    collections = await CollectionAPIService.getAllData().then((value) {
      isLoading = false;
      return value;
    });
    EasyLoading.dismiss();
    update();
  }
}
