// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

// ignore: must_be_immutable
class GridViewActivitiesList extends StatelessWidget {
  GridViewActivitiesList({
    required this.onPress,
    required this.title,
    required this.image,
    Key? key,
  }) : super(key: key);
  VoidCallback onPress;
  String image;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        color: Colors.cyan[100],
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 42,
              height: 42,
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
                
              ),
            ),
            const SizedBox(height: defaultPadding / 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,
                color: Colors.grey[800]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
