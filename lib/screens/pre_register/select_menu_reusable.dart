import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:super_home_member/screens/pre_register/controller/PreRegisterController.dart';

import '../../config/constanent.dart';
import '../widgets/constants.dart';

class SelectCategory extends StatelessWidget {
   SelectCategory({
    Key? key,
    required this.categoryNameReq,
    //required this.statusReq,
    required this.statusList,
    //required this.itemReq,
    required this.onSelected,
    required this.selectedValue,

  }) : super(key: key);
  final String categoryNameReq;
  //final int statusReq;
  List statusList ;
  //final String itemReq;
  final String selectedValue;
  Function(String) onSelected;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration:  BoxDecoration(
        color: Colors.cyan[50],
        borderRadius: BorderRadius.circular(12),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),

                )
              ],
            ),
          ),
          //


          Padding(
            padding: const EdgeInsets.fromLTRB(10,5,0,5),
            child: Row(
              children: [
                Text(
                  categoryNameReq,
                  style:
                  TextStyle(fontSize: 14, color: Colors.grey.shade800),
                ),
                Text(
                  "*",
                  style:
                  TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),


          //const SizedBox(height: defaultPadding / 2),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 3),
            child: Container(
              height: 43,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(defaultPadding / 4),
              ),
              child: DropdownButton<String>(
                // Initial Value

                value: selectedValue,
                alignment: Alignment.center, isExpanded: true,
                underline: Container(),
                // Array list of items

                items: statusList.map((item) {
                  return DropdownMenuItem <String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (newValue){
                  onSelected(newValue!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

