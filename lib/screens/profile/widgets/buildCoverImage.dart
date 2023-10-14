// ignore_for_file: file_names

import 'package:flutter/material.dart';

Container buildCoverImage(coverHeight, img) {
  return Container(
    color: Colors.grey,
    child: Image.asset(
      img,
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );
}
