// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class SideNavContainer extends StatelessWidget {
  Widget child;
  SideNavContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        // const MySideNavigationBar(),
      ],
    );
  }
}
