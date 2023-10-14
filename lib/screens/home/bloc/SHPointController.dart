// ignore_for_file: file_names, prefer_typing_uninitialized_variables, avoid_print

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/home/services/shpoint_api_service.dart';

class SHPointController extends GetxController {
  bool isShowPoint = false;
  // late double shpoint;
  bool isLoading = false;
  final box = GetStorage();
  @override
  void onInit() async {
    super.onInit();
    await getShPoints();
  }

  onPressSHPointButton() {
    isShowPoint = !isShowPoint;
    getShPoints();
    update();
  }

  getShPoints() async {
    isLoading = true;
    if (box.read('shPoint') == null) {
      box.write('shPoint', '00');
      // shpoint = 00;
    }
    try {
      await SHPointAPIService.getData().then((value) {
        // shpoint = double.parse(value.balance);
        box.write('shPoint', value.balance.toString());
        isLoading = false;
        return value;
      });
    } catch (e) {
      print("SH Point: $e");
    }
    update();
  }

  get shPoint => box.read('shPoint');
}
