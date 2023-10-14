// ignore_for_file: file_names, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomeMenuController extends GetxController {
  bool isSliderOpen = false;
  Offset offset = Offset.zero;
  double top = 5;
  double bottom = 100;
  Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  onPressMenuButton() {
    print(DateTime.now().weekday);
    isSliderOpen = !isSliderOpen;
    if (isSliderOpen) {
      if (offset.dy > 325) {
        offset = Offset(offset.dx, 325);
        top = offset.dy;
        bottom = 25;
      } else if (offset.dy > 250) {
        bottom = 50;
      } else if (offset.dy > 200) {
        bottom = 100;
      } else if (offset.dy > 100) {
        bottom = 150;
      } else if (offset.dy > 50) {
        bottom = 200;
      } else {
        bottom = 220;
      }
    }
    update();
  }

  onPanUpdate(details) {
    print(offset.dy);
    // print(details.delta.dy);
    if (offset.dy <= -0.5) {
      offset = Offset(offset.dx, -0.5);
    }
    if (offset.dy >= 435) {
      offset = Offset(offset.dx, 435);
    }
    if (!isSliderOpen && offset.dy >= -0.5) {
      offset = Offset(offset.dx, offset.dy + details.delta.dy);
      top = offset.dy + 5;
      bottom = 10;
    }

    update();
  }
}
