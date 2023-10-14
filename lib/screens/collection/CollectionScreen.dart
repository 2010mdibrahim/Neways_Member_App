// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/screens/collection/components/CollectionBody.dart';
import 'package:super_home_member/screens/widgets/SideNavContainer.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideNavContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
            toolbarHeight: 35,
            title: Text("All Collections"),centerTitle: true),
        body: const CollectionBody(),
      ),
    );
  }
}
