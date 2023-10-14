// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

void showCustomDialog(BuildContext context,
    {double height = 240, required Widget widgets}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: height,
          child: widgets,
          margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
