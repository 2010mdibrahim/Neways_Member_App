// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/screens/widgets/SideNavContainer.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import './components/PackageShiftingBody.dart';

class PackageShiftingScreen extends StatelessWidget {
  const PackageShiftingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideNavContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
            toolbarHeight: 35,
            title: Text("Package Shifting"),centerTitle: true),
        body: const PackageShiftingBody(),
      ),
    );
  }
}
