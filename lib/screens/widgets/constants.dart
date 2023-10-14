import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

String socketURL = "116.68.198.178:5005";
String chatImageURL = "http://116.68.198.178:5005/images/";

const appVersion = '1.0.5'; // App Version

get isDepHead {
  return GetStorage().read('isDepHead') ?? GetStorage().read('inDepHead');
}

get isBoss {
  return GetStorage().read('departmentName') == "Top Management ";
}

class DColors {
  DColors._();

  static const Color primary = Color(0xFF676FA3);
  static Color secondary = const Color(0xFF676FA3).withOpacity(0.2);
  static const Color background = Color(0xFFEEF2FF);
  static const Color card = Color(0xFFCDDEFF);
  static const Color cardLight = Color(0xFFDAE5FF);
  static const Color highLight = Color(0xFFFF5959);
  static const Color black = Color(0xFF191919);
  static const Color white = Color(0xFFFFFFFF);
}

class DPadding {
  DPadding._();

  static double full = 16.0;
  static double half = 8.0;
}
class DRadius {
  DRadius._();

  static double full = 16.0;
  static double half = 8.0;
}

class DTextStyle {
  DTextStyle._();

  static TextStyle textTitleStyle = TextStyle(
      color: Colors.grey.shade800, fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle textTitleStyle2 = TextStyle(
      color: Colors.grey.shade800, fontSize: 21, fontWeight: FontWeight.bold);
  static TextStyle textTitleStyle3 = TextStyle(
      color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle textSubTitleStyle = TextStyle(
      color: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.normal);
  static TextStyle textSubTitleBoldStyle = TextStyle(
      color: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.bold);
  static TextStyle textSubTitleBoldStyle2 = const TextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);
  static TextStyle textSubTitleStyle2 = TextStyle(
      color: Colors.grey.shade600, fontSize: 10, fontWeight: FontWeight.w500);
}

class HeightSpace extends StatelessWidget {
  final double height;
  const HeightSpace({Key? key, this.height = 8.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class WidthSpace extends StatelessWidget {
  final double width;
  const WidthSpace({Key? key, this.width = 8.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
