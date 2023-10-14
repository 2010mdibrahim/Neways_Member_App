// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

// ignore: must_be_immutable
class GridViewList extends StatelessWidget {
  GridViewList({
    required this.onPress,
    required this.title,
    required this.image,
    this.imageSize = 55,
    this.fontSize = 12,
    Key? key,
  }) : super(key: key);
  VoidCallback onPress;
  String image;
  String title;
  double imageSize;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: defaultPaddingEdge,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.cyan[50],
            borderRadius: BorderRadius.circular(defaultPadding / 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: defaultPadding / 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color:Colors.grey[800] ),
            ),
          ],
        ),
      ),
    );
  }
}
