// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';

class MemberCancelationBody extends StatelessWidget {
  const MemberCancelationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: defaultPaddingEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
              visible: true,
              child: TextButton(
                onPressed: (() async {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Alert"),
                      content: const Text(
                          "Are you sure ? Do you want to cancel your member booking?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: (() {}),
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: primaryColor),
                          child: const Text("Yes"),
                        ),
                        TextButton(
                          onPressed: (() => Navigator.pop(context)),
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.red),
                          child: const Text("No"),
                        ),
                      ],
                    ),
                  );
                }),
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.red),
                child: const Text("Cancel Request"),
              )),
          Visibility(
            visible: true,
            child: Container(
              padding: defaultPaddingEdge,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(defaultPadding / 2)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cancellation date",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          Text(
                            numToMonth("03/12/2020"),
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Reason",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          Text(
                            "Personal Problem",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  TextButton(
                    onPressed: (() {}),
                    style: TextButton.styleFrom(
                        primary: Colors.white, backgroundColor: primaryColor),
                    child: const Text("Withdraw Request"),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          Visibility(
            visible: true,
            child: Container(
              padding: defaultPaddingEdge,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(defaultPadding / 2)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cancellation date",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          Text(
                            numToMonth("03/12/2020"),
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Reason",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          Text(
                            "500 taka ebill deduct from deposit",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  TextButton(
                    onPressed: (() {
                      Get.snackbar(
                        'Sorry',
                        "Member Cancelation Option Currently Unavailable. Please contact the front desk",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(8),
                        backgroundColor: Colors.black,
                      );
                    }),
                    style: TextButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        primary: Colors.red,
                        backgroundColor: Colors.red.withOpacity(0.2)),
                    child: const Text("Auto Cancel"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
