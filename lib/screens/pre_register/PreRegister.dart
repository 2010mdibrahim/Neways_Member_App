import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/login/widgets/textField.dart';
import 'package:super_home_member/screens/pre_register/controller/PreRegisterController.dart';
import 'package:super_home_member/screens/rules_regulations/RulesRegulationScreen.dart';
import 'package:super_home_member/screens/widgets/constants.dart';
import 'select_menu_reusable.dart';
import 'widgets/image.dart';


class PreRegister extends StatelessWidget {
   PreRegister({Key? key}) : super(key: key);
   // final controller = Get.put(PreRegisterController());
  void Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    print(isvalid);
  }

   var controller2 = "data";

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
        statusBarIconBrightness: Brightness.dark));
    Get.put(PreRegisterController()).getBranch();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight:35 ,
          // context: context,
          title: const Text("Pre Register"),centerTitle: true

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: GetBuilder<PreRegisterController>(
              init: PreRegisterController(),
              builder: (controller) {
                var labelText;
                return ListView(
                  physics:  const BouncingScrollPhysics(),
                  children: [

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,5,0,15),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: Colors.black,
                                width: 2.0, // Underline thickness
                              ))
                          ),
                          child: Text("Fill up this form with your correct information",style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w800,
                              shadows: [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    color: Colors.grey.shade300,
                                    offset:  const Offset(2, 2),
                                ),
                              ],
                          ),
                          ),
                        ),
                      ),
                    ),


                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background
                      ),
                      child: CustomeTextField(
                        controller: controller.fullName,
                        labelText: "Full Name",
                        hintText: "Enter your full name",
                      ),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.fatherName,
                      labelText: "Father Name",
                      hintText: "Enter your father name",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),


                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,5,0,5),
                            child:  RichText(
                              text: TextSpan(
                                text: 'Date Of Birth',
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),),
                                ],
                              ),
                            )
                          ),
                          //const SizedBox(height: defaultPadding / 2),
                          InkWell(
                            onTap: () async {
                              await controller.pickDate(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 3),
                              child: Container(
                                height: 43,
                                padding: const EdgeInsets.all(12),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.circular(defaultPadding / 4),
                                ),
                                child: RichText(
                                    text: TextSpan(children: [
                                      const WidgetSpan(
                                        child: Icon(
                                          Icons.calendar_month_rounded,
                                          color: Colors.cyan,
                                          size: 18,
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                          ' ${numToMonth("${controller.dateOfBirth.day}/${controller.dateOfBirth.month}/${controller.dateOfBirth.year}")}',
                                          style: TextStyle(
                                              color: Colors.grey.shade800, fontSize: 14)
                                      )
                                    ]
                                    )
                                ),
                              ),
                            ),
                          ),
                          //const SizedBox(height: defaultPadding / 2),

                        ],
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'Marital Status',
                      statusList: controller.maritalStatusList,
                      selectedValue: controller.maritalStatus,
                      onSelected: (s ) {controller.selectMaritalStatus(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),


                    SelectCategory(
                      categoryNameReq: 'Blood Group',
                      statusList: controller.bloodGroupList,
                      selectedValue: controller.bloodGroup,
                      onSelected: (s ) {controller.selectBloodGroup(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'Religion',
                      statusList: controller.religionList,
                      selectedValue: controller.religion,
                      onSelected: (s ) {controller.selectReligion(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),


                    SelectCategory(
                      categoryNameReq: 'Occupation',
                      statusList: controller.occupationList,
                      selectedValue: controller.occupation,
                      onSelected: (s ) {controller.selectOccupation(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),


                    SelectCategory(
                      categoryNameReq: 'Educational Qualification',
                      statusList: controller.qualificationList,
                      selectedValue: controller.qualification,
                      onSelected: (s ) {controller.selectQualification(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),

                    /// Phone number /////
                    CustomeTextField(
                      controller: controller.phoneNumber,
                      //labelText: "Phone(Must be exist WhatsApp)",
                      labelText: 'Phone Number',
                      labelText2: "(Must exist WhatsApp number)",
                      hintText: "Enter your phone number",
                      keyboardType: TextInputType.phone,
                      onChanged: ((value) {
                        if (value.length == 11) {
                          controller.isReadyToSendOtp = true;
                          controller.update();
                        }
                        else {
                          if (controller.isReadyToSendOtp) {
                            controller.isReadyToSendOtp = false;
                            controller.update();
                          }
                        }
                      }),
                      suffixIcon: Visibility(
                        visible: controller.isReadyToSendOtp,
                        child: TextButton(
                            onPressed: () {
                              if (controller.phoneNumber.text.length == 11) {
                                controller.phoneValidation();
                              }
                              else {
                                Get.snackbar('Warning',
                                    "Phone number must be required 11 digit",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                    margin: const EdgeInsets.all(8),
                                    backgroundColor: Colors.orange.shade500);
                              }
                            },
                            child: Text(
                              'Send OTP'.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                        ),
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    Visibility(
                      visible: controller.isValidPhone,
                      child: CustomeTextField(
                        controller: controller.otpController,
                        labelText: "OTP",
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          if (value.length >= 4) controller.otpValidation();
                        },
                        hintText: "Enter otp number",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    /// email /////

                    CustomeTextField(
                      controller: controller.email,
                      onChanged: ((value) {
                        if (GetUtils.isEmail(value)) {
                          if (!controller.isEmailSend) {
                            controller.setEmailSend(true);
                            Future.delayed(const Duration(seconds: 1), () {
                              (controller.emailValidation()==true);
                              /// EmailValidator.validate(email)
                            });
                          } else {
                            Future.delayed(const Duration(seconds: 1), () {
                              controller.setEmailSend(true);
                            });
                          }
                        } else {
                          controller.setEmailSend(false);
                        }
                      }),
                      labelText: "Email",
                      hintText: "Enter your email address",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.nid,
                      labelText: "NID",
                      hintText: "Enter your nid number",
                      keyboardType: TextInputType.phone,
                      onChanged: ((value) => {
                            // 8719637236
                            if (value.length >= 10) {controller.nidValidation()}
                          }),
                    ),
                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.passportNo,
                      labelText: "Passport Number",
                      keyboardType: TextInputType.text,
                      hintText: "Enter your passport number",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'How to find Us',
                      statusList: controller.findUsList,
                      selectedValue: controller.findUs,
                      onSelected: (s ) {controller.selectFindUs(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background
                      ),
                      child: CustomeTextField(
                        controller: controller.permanentAddress,
                        labelText: "Permanent Address",
                        hintText: "Enter your Village, Post-office, Thana, Zilla",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background
                      ),
                      child: CustomeTextField(
                        controller: controller.presentAddress,
                        labelText: "Present Address",
                        hintText: "Enter your Village, Post-office, Thana, Zilla",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),


                    CustomeTextField(
                      controller: controller.eContactName,
                      labelText: "Emergency Contact Name",
                      hintText: "Enter your emergency contact name",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),


                    SelectCategory(
                      categoryNameReq: 'Emergency Contact Relation',
                      statusList: controller.relationList,
                      selectedValue: controller.eContactRelation,
                      onSelected: (s ) {controller.selectRelation(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.eContactNumber,
                      keyboardType: TextInputType.phone,
                      labelText: "Emergency Contact Phone",
                      hintText: "Enter your emergency contact number",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.eContactAddress,
                      labelText: "Emergency Contact Address",
                      hintText: "Enter your emergency contact address",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    ImageUpload(),

                    const SizedBox(height: defaultPadding / 1.5),
                    Row(
                      children: [
                        Checkbox(
                            value: controller.isAgree,
                            onChanged: (value) => controller.setAgree(value)),
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text:
                                    "By pre booking a service, you agree with our ",
                                style: TextStyle(color: Colors.black),),
                            WidgetSpan(
                                child: InkWell(
                              onTap: () => Get.to(RulesRegulationScreen()),
                              child: const Text(
                                "Rules and Regulation.",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ))
                          ],),),
                        ),
                      ],
                    ),

                    const SizedBox(height: defaultPadding),

                    Visibility(
                      visible: controller.isValidOtp,
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextButton(
                          onPressed: () {
                            print("controller.phoneNumber.text: ${controller.phoneNumber.text}");
                            //return;
                            controller.askPermissions("member", controller.phoneNumber.text);
                            controller.submit();
                          },
                          /*onPressed: () {
                            controller.askPermissions(context);
                            controller.submit();
                          },
                           */
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: primaryColor,
                          ),
                          child: Text("Submit".toUpperCase()),
                        ),
                      ),
                    ),

                    const SizedBox(height: defaultPadding),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

/// prev
/*
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/login/widgets/textField.dart';
import 'package:super_home_member/screens/pre_register/controller/PreRegisterController.dart';
import 'package:super_home_member/screens/rules_regulations/RulesRegulationScreen.dart';
import 'package:super_home_member/screens/widgets/constants.dart';
import 'widgets/image.dart';


class PreRegister extends StatelessWidget {
   PreRegister({Key? key}) : super(key: key);
  // final controller = Get.put(PreRegisterController());
  void Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    print(isvalid);
  }

   var controller2 = "data";

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
        statusBarIconBrightness: Brightness.dark));
    Get.put(PreRegisterController()).getBranch();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight:35 ,
          // context: context,
          title: const Text("Pre Register"),centerTitle: true

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: GetBuilder<PreRegisterController>(
              init: PreRegisterController(),
              builder: (controller) {
                var labelText;
                return ListView(
                  physics:  const BouncingScrollPhysics(),
                  children: [


                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,5,0,15),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: Colors.black,
                                width: 2.0, // Underline thickness
                              ))
                          ),
                          child: Text("Fill up your correct information",style: TextStyle(
                              fontSize: 19,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w800,
                              shadows: [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    color: Colors.grey.shade300,
                                    offset:  const Offset(2, 2),
                                ),
                              ],
                          ),
                          ),
                        ),
                      ),
                    ),

                    /*
                    SelectCategory(
                      categoryNameReq: 'Marital Status*',
                      statusList: controller.maritalStatusList,
                      selectedValue: controller.maritalStatus,
                      onSelected: (s ) {controller.selectMaritalStatus(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),
                     */

                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background
                      ),
                      child: CustomeTextField(
                        controller: controller.fullName,
                        labelText: "Full Name",
                        hintText: "Enter your full name",
                      ),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.fatherName,
                      labelText: "Father Name",
                      hintText: "Enter your father name",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),


                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*

Text(
                              "Date Of Birth*",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey.shade800),
                            ),
                           */
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,5,0,5),
                            child:  RichText(
                              text: TextSpan(
                                text: 'Date Of Birth',
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),),
                                ],
                              ),
                            )
                          ),
                          //const SizedBox(height: defaultPadding / 2),
                          InkWell(
                            onTap: () async {
                              await controller.pickDate(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 3),
                              child: Container(
                                height: 43,
                                padding: const EdgeInsets.all(12),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.circular(defaultPadding / 4),
                                ),
                                child: RichText(
                                    text: TextSpan(children: [
                                      const WidgetSpan(
                                        child: Icon(
                                          Icons.calendar_month_rounded,
                                          color: Colors.cyan,
                                          size: 18,
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                          ' ${numToMonth("${controller.dateOfBirth.day}/${controller.dateOfBirth.month}/${controller.dateOfBirth.year}")}',
                                          style: TextStyle(
                                              color: Colors.grey.shade800, fontSize: 14)
                                      )
                                    ]
                                    )
                                ),
                              ),
                            ),
                          ),
                          //const SizedBox(height: defaultPadding / 2),

                        ],
                      ),
                    ),


                    ///

                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,5,0,5),
                            child: RichText(
                              text: TextSpan(
                                text: 'Marital Status',
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),),
                                ],
                              ),
                            )
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
                              child: DropdownButton(
                                // Initial Value
                                value: controller.maritalStatus,
                                alignment: Alignment.center, isExpanded: true,
                                underline: Container(),
                                // Array list of items
                                items: controller.maritalStatusList.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (newValue) =>
                                    controller.selectMaritalStatus(newValue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),


                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,5,0,5),
                            child: RichText(
                              text: TextSpan(
                                text: 'Blood Group',
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),),
                                ],
                              ),
                            )
                          ),
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
                              child: DropdownButton(
                                // Initial Value
                                value: controller.bloodGroup,
                                alignment: Alignment.center, isExpanded: true,
                                underline: Container(),

                                // Array list of items
                                items: controller.bloodGroupList.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (newValue) =>
                                    controller.selectBloodGroup(newValue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //const SizedBox(height: defaultPadding / 2),




                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,5,0,5),
                            child: RichText(
                              text: TextSpan(
                                text: 'Religion',
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),),
                                ],
                              ),
                            )
                          ),
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
                              child: DropdownButton(
                                // Initial Value
                                value: controller.religion,
                                alignment: Alignment.center, isExpanded: true,
                                underline: Container(),

                                // Array list of items
                                items: controller.religionList.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (newValue) =>
                                    controller.selectReligion(newValue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //const SizedBox(height: defaultPadding / 2),


                    const SizedBox(height: defaultPadding / 1.5),


                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,5,0,5),
                            child: RichText(
                              text: TextSpan(
                                text: 'Occupation',
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),),
                                ],
                              ),
                            )
                          ),
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
                              child: DropdownButton(
                                // Initial Value
                                value: controller.occupation,
                                alignment: Alignment.center, isExpanded: true,
                                underline: Container(),
                                // Array list of items
                                items: controller.occupationList.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (newValue) =>
                                    controller.selectOccupation(newValue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //const SizedBox(height: defaultPadding / 2),




                    const SizedBox(height: defaultPadding / 1.5),


                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 20, 3),
                            child: RichText(
                              text: TextSpan(
                                text: 'Education Qualification',
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),),
                                ],
                              ),
                            )
                          ),


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
                              child: DropdownButton(
                                // Initial Value
                                value: controller.qualification,
                                alignment: Alignment.center, isExpanded: true,
                                underline: Container(),

                                // Array list of items
                                items: controller.qualificationList.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }
                                ).toList(),
                                onChanged: (newValue) =>
                                    controller.selectQualification(newValue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //const SizedBox(height: defaultPadding / 2),




                    const SizedBox(height: defaultPadding / 1.5),

                    /// Phone number /////

                    CustomeTextField(
                      controller: controller.phoneNumber,
                      //labelText: "Phone(Must be exist WhatsApp)",
                      labelText: 'Phone Number',
                      labelText2: "(Must exist WhatsApp number)",
                      hintText: "Enter your phone number",
                      keyboardType: TextInputType.phone,
                      onChanged: ((value) {
                        if (value.length == 11) {
                          controller.isReadyToSendOtp = true;
                          controller.update();
                        } else {
                          if (controller.isReadyToSendOtp) {
                            controller.isReadyToSendOtp = false;
                            controller.update();
                          }
                        }
                      }),
                      suffixIcon: Visibility(
                        visible: controller.isReadyToSendOtp,
                        child: TextButton(
                            onPressed: () {
                              if (controller.phoneNumber.text.length == 11) {
                                controller.phoneValidation();
                              } else {
                                Get.snackbar('Warning',
                                    "Phone number must be required 11 digit",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                    margin: const EdgeInsets.all(8),
                                    backgroundColor: Colors.orange.shade500);
                              }
                            },
                            child: Text(
                              'Send OTP'.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),

                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 1.5),
                    Visibility(
                      visible: controller.isValidPhone,
                      child: CustomeTextField(
                        controller: controller.otpController,
                        labelText: "OTP",
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          if (value.length >= 4) controller.otpValidation();
                        },
                        hintText: "Enter otp number",
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 1.5),




                    /// email /////

                    CustomeTextField(
                      controller: controller.email,
                      onChanged: ((value) {
                        if (GetUtils.isEmail(value)) {
                          if (!controller.isEmailSend) {
                            controller.setEmailSend(true);
                            Future.delayed(const Duration(seconds: 1), () {
                              (controller.emailValidation()==true);

                              /// EmailValidator.validate(email)

                            });
                          } else {
                            Future.delayed(const Duration(seconds: 1), () {
                              controller.setEmailSend(true);
                            });
                          }
                        } else {
                          controller.setEmailSend(false);
                        }
                      }),
                      labelText: "Email",
                      hintText: "Enter your email address",
                    ),



                    const SizedBox(height: defaultPadding / 1.5),
                    CustomeTextField(
                      controller: controller.nid,
                      labelText: "NID",
                      hintText: "Enter your nid number",
                      keyboardType: TextInputType.phone,
                      onChanged: ((value) => {
                            // 8719637236
                            if (value.length >= 10) {controller.nidValidation()}
                          }),
                    ),
                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.passportNo,
                      labelText: "Passport Number",
                      keyboardType: TextInputType.text,
                      hintText: "Enter your passport number",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 20, 3),
                            child: RichText(
                              text: TextSpan(
                                text: 'How to find us',
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),),
                                ],
                              ),
                            )
                          ),
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
                              child: DropdownButton(
                                // Initial Value
                                value: controller.findUs,
                                alignment: Alignment.center, isExpanded: true,
                                underline: Container(),

                                // Array list of items
                                items: controller.findUsList.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (newValue) =>
                                    controller.selectFindUs(newValue),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    //const SizedBox(height: defaultPadding / 2),

                    const SizedBox(height: defaultPadding / 1.5),

                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(10,5,0,10),
                    //   child: Container(
                    //     // decoration: const BoxDecoration(
                    //     //     border: Border(bottom: BorderSide(
                    //     //       color: Colors.black,
                    //     //       width: 2.0, // Underline thickness
                    //     //     ))
                    //     // ),
                    //     child: Row(
                    //       children: [
                    //         Text("Permanent Address",style: TextStyle(
                    //           fontSize: 15,
                    //           color: Colors.grey.shade800,
                    //           fontWeight: FontWeight.w800,
                    //
                    //         ),),
                    //
                    //         const Text('*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900))
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background
                      ),
                      child: CustomeTextField(
                        controller: controller.permanentAddress,
                        labelText: "Permanent Address",
                        hintText: "Enter your Village, Post-office, Thana, Zilla",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),
                    //  Padding(
                    //   padding: const EdgeInsets.fromLTRB(10,5,0,5),
                    //   child: Container(
                    //     // decoration: const BoxDecoration(
                    //     //     border: Border(bottom: BorderSide(
                    //     //       color: Colors.black,
                    //     //       width: 2.0, // Underline thickness
                    //     //     ))
                    //     // ),
                    //     child: Row(
                    //       children: [
                    //         Text("Present Address",style: TextStyle(
                    //           fontSize: 15,
                    //           color: Colors.grey.shade800,
                    //           fontWeight: FontWeight.w800,
                    //
                    //         ),),
                    //
                    //         const Text('*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900))
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background
                      ),
                      child: CustomeTextField(
                        controller: controller.presentAddress,
                        labelText: "Present Address",
                        hintText: "Enter your Village, Post-office, Thana, Zilla",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    //
                    //
                    // Container(
                    //   decoration: const BoxDecoration(
                    //       shape: BoxShape.rectangle,
                    //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    //       color: DColors.background
                    //   ),
                    //   child: CustomeTextField(
                    //     controller: controller.presentAddress,
                    //     labelText: "Full Name",
                    //     hintText: "Enter your full name",
                    //   ),
                    // ),
                    // ///                     ////////////////////////////////////
                    // Column(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(bottom: 5),
                    //       child: Row(
                    //         children: [
                    //           CustomeTextField2(
                    //             controller: controller.permanentAddress,
                    //             //labelText: "Permanent Address",
                    //             hintText: "Enter your Village",
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(left: 5),
                    //             child: CustomeTextField2(
                    //               controller2: controller.permanentAddress,
                    //               //labelText: "Permanent Address",
                    //               hintText: "Enter your Post-Office",
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //
                    //     Row(
                    //       children: [
                    //         CustomeTextField2(
                    //           controller3: controller.permanentAddress,
                    //           //labelText: "Permanent Address",
                    //           hintText: "Enter your Police Station",
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 5),
                    //           child: CustomeTextField2(
                    //             controller4: controller.permanentAddress,
                    //             //labelText: "Permanent Address",
                    //             hintText: "Enter your Zilla",
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    //
                    // const SizedBox(height: defaultPadding / 1.5),
                    //
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(10,5,0,10),
                    //   child: Container(
                    //     // decoration: const BoxDecoration(
                    //     //     border: Border(bottom: BorderSide(
                    //     //       color: Colors.black,
                    //     //       width: 2.0, // Underline thickness
                    //     //     ))
                    //     // ),
                    //     child: Row(
                    //       children: [
                    //         Text("Present Address",style: TextStyle(
                    //           fontSize: 16,
                    //           color: Colors.grey.shade800,
                    //           fontWeight: FontWeight.w800,
                    //
                    //         ),),
                    //         const Text('*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900))
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //
                    //
                    //
                    //
                    //
                    // ///                     ////////////////////////////////////
                    // Column(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(bottom: 5),
                    //       child: Row(
                    //         children: [
                    //           CustomeTextField2(
                    //             controller: controller.presentAddress,
                    //             //labelText: "Permanent Address",
                    //             hintText: "Enter your Village",
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(left: 5),
                    //             child: CustomeTextField2(
                    //               controller2: controller.presentAddress,
                    //               //labelText: "Permanent Address",
                    //               hintText: "Enter your Post-Office",
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //
                    //     Row(
                    //       children: [
                    //         CustomeTextField2(
                    //           controller3: controller.presentAddress,
                    //           //labelText: "Permanent Address",
                    //           hintText: "Enter your Police Station",
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 5),
                    //           child: CustomeTextField2(
                    //             controller4: controller.presentAddress,
                    //             //labelText: "Permanent Address",
                    //             hintText: "Enter your Zilla",
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    //
                    //
                    // ///                     ////////////////////////////////////





                    // const SizedBox(height: defaultPadding / 1),

                    CustomeTextField(
                      controller: controller.eContactName,
                      labelText: "Emergency Contact Name",
                      hintText: "Enter your emergency contact name",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 20, 3),
                            child: RichText(
                                text: TextSpan(
                                  text: 'Emergency Contact Relation',
                                  style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                  children: const <TextSpan>[
                                    TextSpan(text: '*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),),
                                  ],
                                ),
                              )
                          ),
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
                              child: DropdownButton(
                                // Initial Value
                                value: controller.eContactRelation,
                                alignment: Alignment.center, isExpanded: true,
                                underline: Container(),

                                // Array list of items
                                items: controller.relationList.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (newValue) =>
                                    controller.selectRelation(newValue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //const SizedBox(height: defaultPadding / 2),

                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.eContactNumber,
                      keyboardType: TextInputType.phone,
                      labelText: "Emergency Contact Phone",
                      hintText: "Enter your emergency contact number",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.eContactAddress,
                      labelText: "Emergency Contact Address",
                      hintText: "Enter your emergency contact address",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    ImageUpload(),

                    const SizedBox(height: defaultPadding / 1.5),
                    Row(
                      children: [
                        Checkbox(
                            value: controller.isAgree,
                            onChanged: (value) => controller.setAgree(value)),
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text:
                                    "By pre booking a service, you agree with our ",
                                style: TextStyle(color: Colors.black),),
                            WidgetSpan(
                                child: InkWell(
                              onTap: () => Get.to(RulesRegulationScreen()),
                              child: const Text(
                                "Rules and Regulation.",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ))
                          ],),),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    /// Remove Visibility Widget

                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 45,
                    //   child: TextButton(
                    //     onPressed: () {
                    //       //controller.askPermissions(context);
                    //       controller.submit();
                    //     },
                    //     style: TextButton.styleFrom(
                    //       foregroundColor: Colors.white,
                    //       backgroundColor: primaryColor,
                    //     ),
                    //     child: Text("Submit".toUpperCase()),
                    //   ),
                    // ),

                    Visibility(
                      visible: controller.isValidOtp,
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextButton(
                          onPressed: () {
                            print("controller.phoneNumber.text: ${controller.phoneNumber.text}");
                            //return;
                            controller.askPermissions("member", controller.phoneNumber.text);
                            controller.submit();
                          },
                          /*onPressed: () {
                            controller.askPermissions(context);
                            controller.submit();
                          },
                           */
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: primaryColor,
                          ),
                          child: Text("Submit".toUpperCase()),
                        ),
                      ),
                    ),

                    const SizedBox(height: defaultPadding),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

 */


