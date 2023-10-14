// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

// ignore: must_be_immutable
class GridViewFacilitiesList extends StatelessWidget {
  GridViewFacilitiesList({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            height: 55,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              color: Colors.blue[200],
            ),
          ),
          Container(
            height: 24,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style:  TextStyle(fontSize: 10,fontWeight: FontWeight.w900,
                  color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}
