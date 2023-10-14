import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_home_member/config/constanent.dart';

class CustomeTextField extends StatelessWidget {
  TextEditingController controller;
  late TextInputType keyboardType;
  String hintText;
  CustomeTextField({
    Key? key,
    required this.controller,
    keyboardType = TextInputType.text,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(defaultPadding / 2),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: [
          if (keyboardType == TextInputType.number)
            FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
      ),
    );
  }
}
