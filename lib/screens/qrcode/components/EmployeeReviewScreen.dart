import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/qrcode/bloc/QRCodeController.dart';
import 'package:super_home_member/screens/widgets/buildAppBar.dart';

class EmployeeReviewScreen extends StatelessWidget {
  const EmployeeReviewScreen({Key? key}) : super(key: key);
  // final QRCodeController controller = Get.put(QRCodeController());
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(title: "Back"),
      body: SingleChildScrollView(
          child: GetBuilder<QRCodeController>(
              init: QRCodeController(),
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          controller.employee.photo!,
                          width: _size.width / 2.5,
                          height: _size.width / 2.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      Text(
                        controller.employee.fullName!,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      Text(
                        "${controller.employee.designationName!} - ${controller.employee.departmentName!}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade700),
                      ),
                      const SizedBox(height: defaultPadding),
                      RatingBar.builder(
                        initialRating: 2.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                          controller.setRating(rating);
                        },
                      ),
                      const SizedBox(height: defaultPadding),
                      controller.icon,
                      const SizedBox(height: defaultPadding),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(defaultPadding / 4),
                        ),
                        child: TextField(
                          controller: controller.noteController,
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.all(defaultPadding / 2),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Please write as much as details",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () async {
                                var status = await controller.submit();
                                if (status == true) {
                                  Get.back();
                                  Get.snackbar(
                                    'Success',
                                    "Employee Rating Submit Successfull",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                    margin: const EdgeInsets.all(8),
                                    backgroundColor: Colors.black,
                                  );
                                } else {
                                  EasyLoading.dismiss();
                                  Get.snackbar(
                                    'Wrong',
                                    "Employee Rating Submit Erroe",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                    margin: const EdgeInsets.all(8),
                                    backgroundColor: Colors.red,
                                  );
                                }
                              },
                              child: Text('Submit'.toUpperCase()),
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  primary: Colors.white,
                                  padding:
                                      const EdgeInsets.all(defaultPadding)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
