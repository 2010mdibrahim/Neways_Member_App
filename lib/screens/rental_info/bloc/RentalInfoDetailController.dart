// ignore_for_file: file_names, avoid_print

import 'package:get/get.dart';
import 'package:super_home_member/screens/rental_info/models/rentalInfo_details_response.dart';
import 'package:super_home_member/screens/rental_info/services/rental_info_api_service.dart';

class RentalInfoDetailController extends GetxController {
  late RentalInfoDetailsResponse rentalInfo =
      RentalInfoDetailsResponse(items: [], paymentReceivedMethods: []);
  RxBool isLoading = false.obs;
  late int rentalId;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
  }

  setId(value) async {
    isLoading.value = true;
    rentalId = value;
    await getDetails();
    update();
  }

  getDetails() async {
    rentalInfo = await RentalInfoAPIService.getData(id: rentalId);
    print(rentalInfo.id);
    isLoading.value = false;
    print(isLoading.value);
    update();
  }
}
