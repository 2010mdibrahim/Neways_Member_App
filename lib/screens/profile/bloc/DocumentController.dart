// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:super_home_member/screens/profile/models/document_response.dart';
import 'package:super_home_member/screens/profile/services/document_api_service.dart';

class DocumentController extends GetxController {
  late List<DocumentResponse> documents = [];
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    await getDocuments();
  }

  getDocuments() async {
    isLoading = true;
    var datas = await DocumentAPIService.getData();
    if (datas != null) {
      isLoading = false;
      for (DocumentResponse element in datas) {
        if (element.type != '') {
          documents.add(element);
        }
      }
      // documents = datas;
    }
    update();
  }
}
