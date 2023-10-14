// ignore_for_file: file_names

import 'package:get/get.dart';

import '../data/tvList.dart';
import '../domain/live_tv_stream_model.dart';

class LiveTVController extends GetxController {
  List<LiveTvStreamModel> tvList = [];
  bool isBangladsh = true;
  bool isSports = false;
  bool isInfotainment = false;
  bool isNews = false;
  bool isKidCartoon = false;
  bool isRelegion = false;

  @override
  void onInit() {
    super.onInit();
    tvList = [];
    for (var element in dataList) {
      if (element.category == 'Bangladesh') {
        tvList.add(element);
      }
    }
  }

  setBangladesh() {
    isBangladsh = true;
    isSports = false;
    isInfotainment = false;
    isNews = false;
    isKidCartoon = false;
    isRelegion = false;
    tvList = [];
    for (var element in dataList) {
      if (element.category == 'Bangladesh') {
        tvList.add(element);
      }
    }
    update();
  }

  setSports() {
    isBangladsh = false;
    isSports = true;
    isInfotainment = false;
    isNews = false;
    isKidCartoon = false;
    isRelegion = false;
    tvList = [];
    for (var element in dataList) {
      if (element.category == 'Sports') {
        tvList.add(element);
      }
    }
    update();
  }

  setNews() {
    isBangladsh = false;
    isSports = false;
    isInfotainment = false;
    isNews = true;
    isKidCartoon = false;
    isRelegion = false;
    tvList = [];
    for (var element in dataList) {
      if (element.category == 'News') {
        tvList.add(element);
      }
    }
    update();
  }

  setInfotainment() {
    isBangladsh = false;
    isSports = false;
    isInfotainment = true;
    isNews = false;
    isKidCartoon = false;
    isRelegion = false;
    tvList = [];
    for (var element in dataList) {
      if (element.category == 'Infotainment') {
        tvList.add(element);
      }
    }
    update();
  }

  setKidCartoon() {
    isBangladsh = false;
    isSports = false;
    isInfotainment = false;
    isNews = false;
    isKidCartoon = true;
    isRelegion = false;
    tvList = [];
    for (var element in dataList) {
      if (element.category == 'Kid & Cartoon') {
        tvList.add(element);
      }
    }
    update();
  }

  setRelegion() {
    isBangladsh = false;
    isSports = false;
    isInfotainment = false;
    isNews = false;
    isKidCartoon = false;
    isRelegion = true;
    tvList = [];
    for (var element in dataList) {
      if (element.category == 'Relegion') {
        tvList.add(element);
      }
    }
    update();
  }
}
