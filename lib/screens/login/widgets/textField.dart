// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/widgets/constants.dart';

class CustomeTextField extends StatelessWidget {
  final double height;
  final String labelText;
  final String labelText2;
  final String? initialValue;
  final String? hintText;
  final String? hintText2;
  final bool autofocus;
  final bool readOnly;
  final Color color;
  final Color fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  const CustomeTextField({
    Key? key,
    this.height = 43,
    this.labelText = '',
    this.labelText2 = '',
    this.hintText,
    this.hintText2,
    this.autofocus = false,
    this.readOnly = false,
    this.color = DColors.background,
    this.onChanged,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor = Colors.white,
    this.textAlign = TextAlign.left,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.cyan[50],
      ),

      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: labelText.isNotEmpty,
            child: Padding(
              padding:  const EdgeInsets.fromLTRB(10,5, 0,0),
              child: Row(
                children: [
                  Text(
                    labelText,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    labelText2,
                    style: const TextStyle(fontSize: 13,color: Colors.red,fontWeight: FontWeight.w900),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom:0),
                    child: Text(
                      "*",
                      style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w600),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Visibility(
              visible: labelText.isNotEmpty,
              child: const SizedBox(height: defaultPadding / 3),),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),

              child: SizedBox(
                height: height,
                child: TextFormField(
                  autofocus: autofocus,
                  onChanged: onChanged,
                  controller: controller,
                  textAlign: textAlign,
                  keyboardType: keyboardType,
                  onTap: onTap,
                  readOnly: readOnly,
                  initialValue: initialValue,
                  inputFormatters: [
                    if (keyboardType == TextInputType.number)
                      FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),

                      enabledBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.5), width: 1),
                      ),
                      hintText: hintText,
                      prefixIcon: prefixIcon,
                      fillColor: fillColor,
                      suffixIcon: suffixIcon,
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.5), fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CustomeTextField2 extends StatelessWidget {
  final double height;
  final String labelText;
  final String labelText2;
  final String? initialValue;
  final String? hintText;
  final String? hintText2;
  final bool autofocus;
  final bool readOnly;
  final Color color;
  final Color fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  // final TextEditingController? controller2;
  // final TextEditingController? controller3;
  // final TextEditingController? controller4;
  const CustomeTextField2({
    Key? key,
    this.height = 43,
    this.labelText = '',
    this.labelText2 = '',
    this.hintText,
    this.hintText2,
    this.autofocus = false,
    this.readOnly = false,
    this.color = DColors.background,
    this.onChanged,
    this.controller,
    // this.controller2,
    // this.controller3,
    // this.controller4,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor = Colors.white,
    this.textAlign = TextAlign.left,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.initialValue,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.cyan[50],
      ),
      // width: 100,
      height: 55,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: labelText.isNotEmpty,
            child: Padding(
              padding:  const EdgeInsets.fromLTRB(10,5, 0,0),
              child: Container(
                // width: 100,
                child: Row(
                  children: [
                    Text(
                      labelText,
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      labelText2,
                      style: const TextStyle(fontSize: 13,color: Colors.red,fontWeight: FontWeight.w900),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom:0),
                      child: Text(
                        "*",
                        style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w600),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: labelText.isNotEmpty,
            child: const SizedBox(height: defaultPadding / 3)
            ,),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Container(
              // width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),

              child: SizedBox(
                height: height,
                width:  MediaQuery.of(context).size.width * 0.44,
                child: TextFormField(
                  autofocus: autofocus,
                  onChanged: onChanged,
                  controller: controller,
                  textAlign: textAlign,
                  keyboardType: keyboardType,
                  onTap: onTap,
                  readOnly: readOnly,
                  initialValue: initialValue,
                  inputFormatters: [
                    if (keyboardType == TextInputType.number)
                      FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),

                    enabledBorder: OutlineInputBorder(

                      borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.5), width: 1),
                    ),
                    hintText: hintText,
                    prefixIcon: prefixIcon,
                    fillColor: fillColor,
                    suffixIcon: suffixIcon,
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5), fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

