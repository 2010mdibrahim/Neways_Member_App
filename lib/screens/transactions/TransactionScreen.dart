// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/screens/transactions/components/TransactionBody.dart';
import 'package:super_home_member/screens/widgets/SideNavContainer.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideNavContainer(
      child: Scaffold(
        backgroundColor: Colors.cyan[50],
        appBar: AppBar(
            backgroundColor: Colors.cyan[600],
            toolbarHeight: 35, title: const Text("Transactions"),centerTitle: true),
        body: const TransactionBody(),
      ),
    );
  }
}
