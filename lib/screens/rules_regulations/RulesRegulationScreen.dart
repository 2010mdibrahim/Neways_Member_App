// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/rules_regulations/bloc/RulesRegulationController.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class RulesRegulationScreen extends StatelessWidget {
  RulesRegulationScreen({Key? key}) : super(key: key);
  final controller = Get.put(RulesRegulationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight: 35,
          title: Text("Rules & Regulations"), centerTitle: true),
      body: Padding(
        padding: defaultPaddingEdge,
        child: ListView.builder(
          itemCount: controller.rules.length,
          itemBuilder: (context, index) {
            return ListTile(
              dense: true,
              horizontalTitleGap: 0,
              leading: Text('${index + 1}.',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.teal[800]),),
              title: Text(
                controller.rules[index],style:  TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.cyan[800],),
                textAlign: TextAlign.justify,
              ),
            );
          },
        ),
      ),
    );
  }
}
