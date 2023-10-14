// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/screens/widgets/SideNavContainer.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import './components/CheckoutItemBody.dart';

class CheckoutItemScreen extends StatelessWidget {
  const CheckoutItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideNavContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[600],
            toolbarHeight: 35,
            title: const Text("Checkout Items"),centerTitle: true),
        body: const CheckoutItemBody(),
      ),
    );
  }
}
