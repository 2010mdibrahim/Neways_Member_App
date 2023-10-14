// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_home_member/config/constanent.dart';

class RemaingDaySection extends StatelessWidget {
  const RemaingDaySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: defaultPaddingEdge,
      padding: defaultPaddingEdge,
      decoration: const BoxDecoration(
          color: Colors.pink,
          // borderRadius: BorderRadius.circular(defaultPadding / 2),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(defaultPadding * 2),
            topLeft: Radius.circular(2),
            bottomLeft: Radius.circular(2),
            bottomRight: Radius.circular(2),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Avaiable days remaing".toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 16,
              letterSpacing: .7,
              wordSpacing: 1.5,
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: primaryColor,
            child: RichText(
              text: TextSpan(
                text: '7 ',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Days',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade200)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
