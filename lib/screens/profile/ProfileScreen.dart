// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/profile/components/ProfileBody.dart';
import 'package:super_home_member/screens/widgets/SideNavContainer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: bodyColor,
      body: SideNavContainer(child: const ProfileBody()),
    );
  }
}
