// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/screens/widgets/SideNavContainer.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

import './components/MemberCancelationBody.dart';

class MemberCancelationScreen extends StatelessWidget {
  const MemberCancelationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideNavContainer(
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(context: context, title: "Member Cancelation"),
          body: const MemberCancelationBody(),
        ),
      ),
    );
  }
}
