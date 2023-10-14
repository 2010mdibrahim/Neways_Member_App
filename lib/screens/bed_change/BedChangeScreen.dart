// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/screens/bed_change/components/BedChangeBody.dart';
import 'package:super_home_member/screens/widgets/SideNavContainer.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class BedChangeScreen extends StatelessWidget {
  const BedChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideNavContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
            toolbarHeight: 35,
            title: Text("Bed Change"),centerTitle: true),
        body: const BedChangeBody(),
      ),
    );
  }
}
