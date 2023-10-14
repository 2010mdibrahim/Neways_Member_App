import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/event/models/event_category_response_model.dart';
import 'package:super_home_member/screens/event/models/event_response_model.dart';
import 'package:super_home_member/screens/event/services/event_api_service.dart';

class EventController extends GetxController {
  List<EventCategoryResponseModel> eventCategories = [];
  List<EventResponseModel> events = [];
  late EventCategoryResponseModel category;
  late EventResponseModel event;
  late bool isInterested = false;
  final box = GetStorage();
  @override
  void onInit() async {
    super.onInit();
    await getAllEventCategory();
  }

  getAllEventCategory() async {
    EasyLoading.show();
    try {
      eventCategories = await EventAPIService.getAllEventCategory();
    } catch (e) {
      printError(info: e.toString());
    }
    EasyLoading.dismiss();
    update();
  }

  setCategory(EventCategoryResponseModel model) {
    category = model;
    getAllEvent();
    update();
  }

  getAllEvent() async {
    EasyLoading.show();
    try {
      events =
          await EventAPIService.getAllEvent(categoryId: category.id.toString());
    } catch (e) {
      printError(info: e.toString());
    }
    EasyLoading.dismiss();
    update();
  }

  setEvent(EventResponseModel model) {
    event = model;
    checkIsInterested();
    update();
  }

  checkIsInterested() async {
    bool isLogin = box.read('login') ?? false;
    if (isLogin) {
      try {
        isInterested = await EventAPIService.getInterested(
            eventId: event.id, memberId: box.read('id'));
      } catch (e) {
        printError(info: e.toString());
      }
    } else {
      isInterested = false;
    }
    update();
  }

  onClickInterested() async {
    bool isLogin = box.read('login') ?? false;
    if (isLogin) {
      if (!isInterested) {
        EasyLoading.show();
        await EventAPIService.joinEvent(data: {
          'event_id': event.id,
          'member_id': box.read('id'),
          'note': event.title,
          'date':
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          'status': 1
        }).then((value) async {
          Get.snackbar('Success', 'Event Joining Request Submit Successfull',
              backgroundColor: const Color(0x00ffffff),
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.all(defaultPadding));
          await checkIsInterested();
          update();
        });
        EasyLoading.dismiss();
      } else {
        EasyLoading.show();
        await EventAPIService.deleteEvent(
                data: {'event_id': event.id, 'member_id': box.read('id')})
            .then((value) async {
          Get.snackbar('Success', 'Event Joining Request Delete Successfull',
              backgroundColor: const Color(0x00ffffff),
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.all(defaultPadding));
          await checkIsInterested();
          update();
        });
        EasyLoading.dismiss();
      }
    } else {
      Get.snackbar('Event', 'Please Login first',
          backgroundColor: const Color(0x000000ff),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(defaultPadding));
      // Get.to(const LoginScreen());
    }
    update();
  }
}
