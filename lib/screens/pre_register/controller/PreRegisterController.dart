import 'dart:convert';
import 'dart:io';
import 'package:email_validator/email_validator.dart';
// import 'package:email_validator_flutter/email_validator_flutter.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:super_home_member/screens/home/HomeScreen.dart';
import 'package:super_home_member/screens/pre_register/services/PreRegisterServices.dart';
import 'package:super_home_member/screens/request/branch/models/branch_responce.dart';
import '../../auth/bloc/AuthController.dart';
import '../../profile/ProfileScreen.dart';
import '../../profile/phone_contact_service.dart';
import '../../request/services/firestore_api_service.dart';
import '../../widgets/utils.dart';

class PreRegisterController extends GetxController {
  final AuthController _authController = AuthController();
  TextEditingController fullName = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  DateTime dateOfBirth = DateTime(DateTime.now().year - 22);
  String maritalStatus = "Select Status";
  List maritalStatusList = ["Select Status", "Single", "Married"];
  String bloodGroup = "Select Group";
  bool isAgree = false; static const getItem = "GET ITEM";
  bool isValidPhone = false; bool isValidEmail = false;
  bool isValidNid = false; bool isEmailSend = false;
  bool isReadyToSendOtp = false; bool isSendOtp = false;
  bool isValidOtp = false; int? otp;List statusList = [" "];


  @override
  void onInit() async {
    super.onInit();
    await getBranch();
  }

  // image upload ...
  final ImagePicker _picker = ImagePicker();

  late File file;
  String base64Image = "";
  List bloodGroupList = [
    "Select Group",
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
    "Unknown"
  ];
  String religion = "Select Religion";
  List religionList = [
    "Select Religion",
    "Islam",
    "Hindu",
    "Christian",
    "Buddhist",
    "Other"
  ];
  String occupation = "Select Occupation";
  List occupationList = [
    "Select Occupation",
    "Student",
    "Job Holder",
    "Business Man",
    "Teacher",
    "Journalist",
    "Doctor",
    "Driver",
    "Housewife",
    "Others"
  ];
  String qualification = "Select Qualification";
  List qualificationList = [
    "Select Qualification",
    "PSC",
    "JSC",
    "SSC",
    "HSC",
    "Diploma",
    "B.Sc",
    "M.Sc",
    "BBA",
    "MBA",
    "Honours",
    "Masters",
    "PSD",
    "MBBS",
    "Others"
  ];
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nid = TextEditingController();
  TextEditingController passportNo = TextEditingController();
  String findUs = "Select Option";
  List findUsList = [
    "Select Option",
    "News Paper",
    "Google",
    "Facebook",
    "SMS",
    "Youtube",
    "Parents",
    "TVC",
    "Friends",
    "Colleague",
    "I don't Know",
    "Other"
  ];
  BranchResponse branch = BranchResponse(name: "Select Branch");
  List<BranchResponse> branchList = [
    BranchResponse(name: "Select Branch"),
  ];
  // EmailValidatorFlutter emailValidatorFlutter = EmailValidatorFlutter();
  TextEditingController permanentAddress = TextEditingController();
  TextEditingController presentAddress = TextEditingController();
  TextEditingController eContactName = TextEditingController();
  TextEditingController eContactNumber = TextEditingController();
  String eContactRelation = "Select Relation";
  List relationList = [
    "Select Relation",
    "Father",
    "Mother",
    "Brother",
    "Cousin",
    "Friends",
    "Husband",
    "Wife",
    "Uncle",
    "Aunti",
    "Daughter",
    "Son",
    "Other"
  ];
  TextEditingController eContactAddress = TextEditingController();
  TextEditingController otpController = TextEditingController();

  getBranch() async {
    await EasyLoading.show();

    await PreRegisterAPIService.getAllData().then((value) {
      if (value.runtimeType == List<BranchResponse>) {
        branchList = [
          BranchResponse(name: "Select Branch"),
        ];
        branchList.addAll(value);
      } else {}
    });
    await EasyLoading.dismiss();
    update();
  }

  setAgree(value) {
    isAgree = value;
    update();
  }

  Future pickDate(BuildContext context, {DateTime? initialDate}) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime(DateTime.now().year - 10),
      // firstDate: DateTime.now().subtract(const Duration(days: 0)),
      firstDate: DateTime(DateTime.now().year - (DateTime.now().year - 1950)),
      lastDate: DateTime(DateTime.now().year - 10),
    );

    if (newDate == null) return;
    // return '${date.day}/${date.month}/${date.year}';
    dateOfBirth = newDate;
    update();
    return newDate;
  }

  selectMaritalStatus(value) {
    maritalStatus = value;
    update();
  }

  selectBloodGroup(value) {
    bloodGroup = value;
    update();
  }

  selectReligion(value) {
    religion = value;
    update();
  }

  selectOccupation(value) {
    occupation = value;
    update();
  }

  selectQualification(value) {
    qualification = value;
    update();
  }

  selectRelation(value) {
    eContactRelation = value;
    update();
  }

  selectFindUs(value) {
    findUs = value;
    update();
  }

  selectBranch(value) {
    branch = BranchResponse(name: value);
    update();
  }
///phone/////////////////////////////////////////////////////
  phoneValidation() async {
    EasyLoading.show(status: "Sending...");
    // EasyLoading.showProgress(2);
    var data = await PreRegisterAPIService.checkValidity(
        {'phone_number': phoneNumber.text}
    );
    EasyLoading.dismiss();
    if (data['status'] == true) {
      Get.snackbar('Warning', "You are already registered in this number",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.orange.shade500);
    }
    else {
      isValidPhone = true;
      otp = data['otp'];
      Get.snackbar('Success', "Otp Send Successfull",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.green.shade500);
      update();
    }
  }

  setEmailSend(value) {
    isEmailSend = value;
    update();
  }

  Future emailValidation() async {
    EasyLoading.show(status: "Sending...");
    var data = await PreRegisterAPIService.checkValidity({'email': email.text});
    EasyLoading.dismiss();
    box.write(checkEmail, data['status'] == true);
    if (data['status'] == true) {
      Get.snackbar('Warning', "You are already registered in this Email",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.orange.shade500);
    } else {
      isValidEmail = true;
      update();
    }
  }

  nidValidation() async {
    var data = await PreRegisterAPIService.checkValidity({'nid': nid.text});
    if (data['status'] == true) {
      Get.snackbar('Warning', "You are already registered in this NID",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.orange.shade500);
    } else {
      isValidNid = true;
      update();
    }
  }

///o////////////////////////////////////////////////////////////////////////////
  otpValidation() async {
    if (int.parse(otpController.text) != otp) {
      Get.snackbar('Error', "OTP is not valid!",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
    }
    else {
      isValidOtp = true;
      Get.snackbar('Success', "OTP verification successfull",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.green.shade500
      );
    }
    update();
  }

  submit() async {
    if (validateInputField()) {
      //EasyLoading.show(status: "Submit...");
      print({
        "full_name": fullName.text,
        "father_name": fatherName.text,
        "date_of_birth":
        "${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}",
        "marital_status": maritalStatus,
        "blood_group": bloodGroup,
        "religion": religion,
        "occupation": occupation,
        "photo": base64Image,
        "last_qualification": qualification,
        "phone_number": phoneNumber.text,
        "email": email.text,
        "nid": nid.text,
        "passport_no": passportNo.text,
        "find_us": findUs,
        "otp": otpController.text,
        "permanent_address": permanentAddress.text,
        "present_address": presentAddress.text,
        "emergency_contact_name": eContactName.text,
        "emergency_contact_number": eContactNumber.text,
        "emergency_contact_relation": eContactRelation,
        "emergency_contact_address": eContactAddress.text,
      });


      var status = await PreRegisterAPIService.submit({
        "full_name": fullName.text,
        "father_name": fatherName.text,
        "date_of_birth": "${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}",
        "marital_status": maritalStatus,
        "blood_group": bloodGroup,
        "religion": religion,
        "occupation": occupation,
        "photo": base64Image,
        "last_qualification": qualification,
        "phone_number": phoneNumber.text,
        "email": email.text,
        "nid": nid.text,
        "passport_no": passportNo.text,
        "find_us": findUs,
        "otp": otpController.text,
        "permanent_address": permanentAddress.text,
        "present_address": presentAddress.text,
        "emergency_contact_name": eContactName.text,
        "emergency_contact_number": eContactNumber.text,
        "emergency_contact_relation": eContactRelation,
        "emergency_contact_address": eContactAddress.text,
      });

      if (status == 200) {
        await EasyLoading.dismiss();
        Get.snackbar('Success', "Pre-Register Successfully",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            margin: const EdgeInsets.all(8),
            backgroundColor: const Color.fromRGBO(0, 0, 0, 1));
        Get.offAll(HomeScreen());
      } else if (status == 201) {
        await EasyLoading.dismiss();
        Get.snackbar('Warning', "You Are Already Registered",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            margin: const EdgeInsets.all(8),
            backgroundColor: Colors.orange.shade500);
      } else {
        await EasyLoading.dismiss();
        Get.snackbar('Error', "Sorry! Something Wrong. Please Try Again",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            margin: const EdgeInsets.all(8),
            backgroundColor: Colors.red.shade500);
      }
    }
  }



///email///////////////////////////////////////////////////////////////////////////////////////////////

///(!RegExp(r'\S+@\S+\.\S+').hasMatch(email.text) && EmailValidator.validate(email.text))

  validateInputField() {
    
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[cC][oO][mM]$').hasMatch(email.text))   {
      Get.snackbar('Error', "Valid Email must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
    return false;
    }

    else if (fullName.text.isEmpty) {
      Get.snackbar('Error', "Full name must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (fatherName.text.isEmpty) {
      Get.snackbar('Error', "Father name must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (eContactAddress.text.isEmpty) {
      Get.snackbar('Error', "Emergency contact address must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (dateOfBirth == DateTime.now()) {
      Get.snackbar('Error', "Date Of Birth must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (maritalStatus == "Select Status") {
      Get.snackbar('Error', "Marital Status must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (bloodGroup == "Select Group") {
      Get.snackbar('Error', "Blood Group must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (religion == "Select Religion") {
      Get.snackbar('Error', "Religion must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (occupation == "Select Occupation") {
      Get.snackbar('Error', "Occupation must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (qualification == "Select Qualification") {
      Get.snackbar('Error', "Educational Qualification must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (findUs == "Select Option") {
      Get.snackbar('Error', "Find Us option must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }

    // else if (phoneNumber.text.isEmpty) {
    //   Get.snackbar('Error', "Phone Number must be required",
    //       snackPosition: SnackPosition.BOTTOM,
    //       colorText: Colors.white,
    //       margin: const EdgeInsets.all(8),
    //       backgroundColor: Colors.red.shade500);
    //   return false;
    // }

    else if (phoneNumber.text.isEmpty) {
      Get.snackbar('Error', "Phone Number must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (nid.text.isEmpty) {
      Get.snackbar('Error', "NID number must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (permanentAddress.text.isEmpty) {
      Get.snackbar('Error', "Permanent Address must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (presentAddress.text.isEmpty) {
      Get.snackbar('Error', "Present Address must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (eContactName.text.isEmpty) {
      Get.snackbar('Error', "Emergency contact name must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (eContactNumber.text.isEmpty) {
      Get.snackbar('Error', "Emergency contact number must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (eContactRelation.isEmpty) {
      Get.snackbar('Error', "Emergency contact relation must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (otpController.text != otp.toString()) {
      Get.snackbar('Error', "OTP is not valid!",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (!isAgree) {
      Get.snackbar('Error', "You must be Agree Our Terms of Service.",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    // else if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email.text)) {
    //   Get.snackbar('Error', "Please Enter Your Valid Email Number.",
    //       snackPosition: SnackPosition.BOTTOM,
    //       colorText: Colors.white,
    //       margin: const EdgeInsets.all(8),
    //       backgroundColor: Colors.red.shade500);
    //   return false;
    // }
    else {
      return true;
    }
  }



  // ================================= Image from camera
  Future getCameraImage(context) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    file = File(photo!.path);
    base64Image = base64Encode(file.readAsBytesSync());
    update();
    Navigator.pop(context);
  }

  //============================== Image from gallery
  Future getGalleryImage(context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);
    base64Image = base64Encode(file.readAsBytesSync());
    print(base64Image);
    update();
    Navigator.pop(context);
  }

  /// get all contact  /////////////////////////////////////////////////////////////////////////////////
  List _contacts = const [];
  String? _text;
  Future<void> askPermissions( String type, String currentMemberId) async {
    print("MemberId: $currentMemberId");
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      _contacts = await FastContacts.getAllContacts();
      _contacts.removeWhere((element) => (element.phones.isEmpty  || element.phones!.first.number.length>25));
      List<String> contactItems = [];

      var contactLength = _contacts.length;

      for(int i=0; i<contactLength; i++){
        var innerData = jsonEncode(<String, dynamic>{
          "member_id": currentMemberId,
          "email": _contacts[i].emails!.isNotEmpty?_contacts[i].emails!.first.address:"N/A",
          "name": _contacts[i].displayName!.isNotEmpty?_contacts[i].displayName : "N/A",
          "phone": _contacts[i].phones!.isNotEmpty?_contacts[i].phones!.first.number:"N/A",
          "type": type
        });
        contactItems.add(innerData);
      }
      PhoneContactService.uploadContact(contactItems);
    } else {
      _handleInvalidPermissions(permissionStatus, 'context');
    }
  }


  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus, context) {
    if (permissionStatus == PermissionStatus.denied) {///
      const snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      const snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}



/// new
/*
import 'dart:convert';
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:email_validator_flutter/email_validator_flutter.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:super_home_member/screens/home/HomeScreen.dart';
import 'package:super_home_member/screens/pre_register/services/PreRegisterServices.dart';
import 'package:super_home_member/screens/request/branch/models/branch_responce.dart';

import '../../auth/bloc/AuthController.dart';
import '../../profile/ProfileScreen.dart';
import '../../profile/phone_contact_service.dart';
import '../../request/services/firestore_api_service.dart';
import '../../widgets/utils.dart';

class PreRegisterController extends GetxController {
  final AuthController _authController = AuthController();
  TextEditingController fullName = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  DateTime dateOfBirth = DateTime(DateTime.now().year - 22);
  String maritalStatus = "Select Status";
  List maritalStatusList = ["Select Status", "Single", "Married"];
  String bloodGroup = "Select Group";
  bool isAgree = false;
  bool isValidPhone = false;
  bool isValidEmail = false;
  bool isValidNid = false;
  bool isEmailSend = false;
  bool isReadyToSendOtp = false;
  bool isSendOtp = false;
  bool isValidOtp = false;
  int? otp;
  List statusList = [" "];
  static const getItem = "GET ITEM";




  @override
  void onInit() async {
    super.onInit();
    await getBranch();
  }

  // image upload ...
  final ImagePicker _picker = ImagePicker();

  late File file;
  String base64Image = "";
  List bloodGroupList = [
    "Select Group",
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
    "Unknown"
  ];
  String religion = "Select Religion";
  List religionList = [
    "Select Religion",
    "Islam",
    "Hindu",
    "Christian",
    "Buddhist",
    "Other"
  ];
  String occupation = "Select Occupation";
  List occupationList = [
    "Select Occupation",
    "Student",
    "Job Holder",
    "Business Man",
    "Teacher",
    "Journalist",
    "Doctor",
    "Driver",
    "Housewife",
    "Others"
  ];
  String qualification = "Select Qualification";
  List qualificationList = [
    "Select Qualification",
    "PSC",
    "JSC",
    "SSC",
    "HSC",
    "Diploma",
    "B.Sc",
    "M.Sc",
    "BBA",
    "MBA",
    "Honours",
    "Masters",
    "PSD",
    "MBBS",
    "Others"
  ];
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nid = TextEditingController();
  TextEditingController passportNo = TextEditingController();
  String findUs = "Select Option";
  List findUsList = [
    "Select Option",
    "News Paper",
    "Google",
    "Facebook",
    "SMS",
    "Youtube",
    "Parents",
    "TVC",
    "Friends",
    "Colleague",
    "I don't Know",
    "Other"
  ];
  BranchResponse branch = BranchResponse(name: "Select Branch");
  List<BranchResponse> branchList = [
    BranchResponse(name: "Select Branch"),
  ];
  EmailValidatorFlutter emailValidatorFlutter = EmailValidatorFlutter();
  TextEditingController permanentAddress = TextEditingController();
  TextEditingController presentAddress = TextEditingController();
  TextEditingController eContactName = TextEditingController();
  TextEditingController eContactNumber = TextEditingController();
  String eContactRelation = "Select Relation";
  List relationList = [
    "Select Relation",
    "Father",
    "Mother",
    "Brother",
    "Cousin",
    "Friends",
    "Husband",
    "Wife",
    "Uncle",
    "Aunti",
    "Daughter",
    "Son",
    "Other"
  ];
  TextEditingController eContactAddress = TextEditingController();
  TextEditingController otpController = TextEditingController();

  getBranch() async {
    await EasyLoading.show();

    await PreRegisterAPIService.getAllData().then((value) {
      if (value.runtimeType == List<BranchResponse>) {
        branchList = [
          BranchResponse(name: "Select Branch"),
        ];
        branchList.addAll(value);
      } else {}
    });
    await EasyLoading.dismiss();
    update();
  }

  setAgree(value) {
    isAgree = value;
    update();
  }

  Future pickDate(BuildContext context, {DateTime? initialDate}) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime(DateTime.now().year - 10),
      // firstDate: DateTime.now().subtract(const Duration(days: 0)),
      firstDate: DateTime(DateTime.now().year - (DateTime.now().year - 1950)),
      lastDate: DateTime(DateTime.now().year - 10),
    );

    if (newDate == null) return;
    // return '${date.day}/${date.month}/${date.year}';
    dateOfBirth = newDate;
    update();
    return newDate;
  }

  selectMaritalStatus(value) {
    maritalStatus = value;
    update();
  }

  selectBloodGroup(value) {
    bloodGroup = value;
    update();
  }

  selectReligion(value) {
    religion = value;
    update();
  }

  selectOccupation(value) {
    occupation = value;
    update();
  }

  selectQualification(value) {
    qualification = value;
    update();
  }

  selectRelation(value) {
    eContactRelation = value;
    update();
  }

  selectFindUs(value) {
    findUs = value;
    update();
  }

  selectBranch(value) {
    branch = BranchResponse(name: value);
    update();
  }
///phone/////////////////////////////////////////////////////
  phoneValidation() async {
    EasyLoading.show(status: "Sending...");
    var data = await PreRegisterAPIService.checkValidity(
        {'phone_number': phoneNumber.text});
    EasyLoading.dismiss();
    if (data['status'] == true) {
      Get.snackbar('Warning', "You are already registered in this number",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.orange.shade500);
    }
    else {
      isValidPhone = true;
      otp = data['otp'];
      Get.snackbar('Success', "Otp Send Successfull",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.green.shade500);
      update();
    }
  }

  setEmailSend(value) {
    isEmailSend = value;
    update();
  }

  Future emailValidation() async {
    EasyLoading.show(status: "Sending...");
    var data = await PreRegisterAPIService.checkValidity({'email': email.text});
    EasyLoading.dismiss();
    box.write(checkEmail, data['status'] == true);
    if (data['status'] == true) {
      Get.snackbar('Warning', "You are already registered in this Email",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.orange.shade500);
    } else {
      isValidEmail = true;
      update();
    }
  }

  nidValidation() async {
    var data = await PreRegisterAPIService.checkValidity({'nid': nid.text});
    if (data['status'] == true) {
      Get.snackbar('Warning', "You are already registered in this NID",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.orange.shade500);
    } else {
      isValidNid = true;
      update();
    }
  }

  otpValidation() async {
    if (int.parse(otpController.text) != otp) {
      Get.snackbar('Error', "OTP is not valid!",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
    } else {
      isValidOtp = true;
      Get.snackbar('Success', "OTP verification successfull",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.green.shade500);
    }
    update();
  }

  submit() async {
    if (validateInputField()) {
      //EasyLoading.show(status: "Submit...");
      print({
        "full_name": fullName.text,
        "father_name": fatherName.text,
        "date_of_birth":
        "${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}",
        "marital_status": maritalStatus,
        "blood_group": bloodGroup,
        "religion": religion,
        "occupation": occupation,
        "photo": base64Image,
        "last_qualification": qualification,
        "phone_number": phoneNumber.text,
        "email": email.text,
        "nid": nid.text,
        "passport_no": passportNo.text,
        "find_us": findUs,
        "otp": otpController.text,
        "permanent_address": permanentAddress.text,
        "present_address": presentAddress.text,
        "emergency_contact_name": eContactName.text,
        "emergency_contact_number": eContactNumber.text,
        "emergency_contact_relation": eContactRelation,
        "emergency_contact_address": eContactAddress.text,
      });


      var status = await PreRegisterAPIService.submit({
        "full_name": fullName.text,
        "father_name": fatherName.text,
        "date_of_birth": "${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}",
        "marital_status": maritalStatus,
        "blood_group": bloodGroup,
        "religion": religion,
        "occupation": occupation,
        "photo": base64Image,
        "last_qualification": qualification,
        "phone_number": phoneNumber.text,
        "email": email.text,
        "nid": nid.text,
        "passport_no": passportNo.text,
        "find_us": findUs,
        "otp": otpController.text,
        "permanent_address": permanentAddress.text,
        "present_address": presentAddress.text,
        "emergency_contact_name": eContactName.text,
        "emergency_contact_number": eContactNumber.text,
        "emergency_contact_relation": eContactRelation,
        "emergency_contact_address": eContactAddress.text,
      });

      if (status == 200) {
        await EasyLoading.dismiss();
        Get.snackbar('Success', "Pre-Register Successfully",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            margin: const EdgeInsets.all(8),
            backgroundColor: const Color.fromRGBO(0, 0, 0, 1));
        Get.offAll(HomeScreen());
      } else if (status == 201) {
        await EasyLoading.dismiss();
        Get.snackbar('Warning', "You Are Already Registered",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            margin: const EdgeInsets.all(8),
            backgroundColor: Colors.orange.shade500);
      } else {
        await EasyLoading.dismiss();
        Get.snackbar('Error', "Sorry! Something Wrong. Please Try Again",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            margin: const EdgeInsets.all(8),
            backgroundColor: Colors.red.shade500);
      }
    }
  }



///email///////////////////////////////////////////////////////////////////////////////////////////////

///(!RegExp(r'\S+@\S+\.\S+').hasMatch(email.text) && EmailValidator.validate(email.text))

  validateInputField() {

    if (!EmailValidator.validate(email.text))   {
      Get.snackbar('Error', "Valid Email must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
    return false;
    }

    else if (fullName.text.isEmpty) {
      Get.snackbar('Error', "Full name must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (fatherName.text.isEmpty) {
      Get.snackbar('Error', "Father name must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (eContactAddress.text.isEmpty) {
      Get.snackbar('Error', "Emergency contact address must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (dateOfBirth == DateTime.now()) {
      Get.snackbar('Error', "Date Of Birth must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (maritalStatus == "Select Status") {
      Get.snackbar('Error', "Marital Status must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (bloodGroup == "Select Group") {
      Get.snackbar('Error', "Blood Group must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (religion == "Select Religion") {
      Get.snackbar('Error', "Religion must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (occupation == "Select Occupation") {
      Get.snackbar('Error', "Occupation must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (qualification == "Select Qualification") {
      Get.snackbar('Error', "Educational Qualification must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (findUs == "Select Option") {
      Get.snackbar('Error', "Find Us option must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }

    else if (phoneNumber.text.isEmpty) {
      Get.snackbar('Error', "Phone Number must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (phoneNumber.text.isEmpty) {
      Get.snackbar('Error', "Phone Number must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (nid.text.isEmpty) {
      Get.snackbar('Error', "NID number must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (permanentAddress.text.isEmpty) {
      Get.snackbar('Error', "Permanent Address must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (presentAddress.text.isEmpty) {
      Get.snackbar('Error', "Present Address must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (eContactName.text.isEmpty) {
      Get.snackbar('Error', "Emergency contact name must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (eContactNumber.text.isEmpty) {
      Get.snackbar('Error', "Emergency contact number must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (eContactRelation.isEmpty) {
      Get.snackbar('Error', "Emergency contact relation must be required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (otpController.text != otp.toString()) {
      Get.snackbar('Error', "OTP is not valid!",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    else if (!isAgree) {
      Get.snackbar('Error', "You must be Agree Our Terms of Service.",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.red.shade500);
      return false;
    }
    // else if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email.text)) {
    //   Get.snackbar('Error', "Please Enter Your Valid Email Number.",
    //       snackPosition: SnackPosition.BOTTOM,
    //       colorText: Colors.white,
    //       margin: const EdgeInsets.all(8),
    //       backgroundColor: Colors.red.shade500);
    //   return false;
    // }
    else {
      return true;
    }
  }





  // ================================= Image from camera
  Future getCameraImage(context) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    file = File(photo!.path);
    base64Image = base64Encode(file.readAsBytesSync());
    update();
    Navigator.pop(context);
  }

  //============================== Image from gallery
  Future getGalleryImage(context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    file = File(image!.path);
    base64Image = base64Encode(file.readAsBytesSync());
    print(base64Image);
    update();
    Navigator.pop(context);
  }

  /// get all contact  /////////////////////////////////////////////////////////////////////////////////
  List _contacts = const [];
  String? _text;
  Future<void> askPermissions( String type, String currentMemberId) async {
    print("MemberId: $currentMemberId");
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      _contacts = await FastContacts.getAllContacts();
      _contacts.removeWhere((element) => (element.phones.isEmpty  || element.phones!.first.number.length>25));
      List<String> contactItems = [];

      var contactLength = _contacts.length;

      for(int i=0; i<contactLength; i++){
        var innerData = jsonEncode(<String, dynamic>{
          "member_id": currentMemberId,
          "email": _contacts[i].emails!.isNotEmpty?_contacts[i].emails!.first.address:"N/A",
          "name": _contacts[i].displayName!.isNotEmpty?_contacts[i].displayName : "N/A",
          "phone": _contacts[i].phones!.isNotEmpty?_contacts[i].phones!.first.number:"N/A",
          "type": type
        });
        contactItems.add(innerData);
      }
      PhoneContactService.uploadContact(contactItems);
    } else {
      _handleInvalidPermissions(permissionStatus, 'context');
    }
  }


  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus, context) {
    if (permissionStatus == PermissionStatus.denied) {///
      const snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      const snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

 */