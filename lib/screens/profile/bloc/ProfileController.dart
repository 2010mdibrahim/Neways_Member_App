// ignore_for_file: file_names
import 'dart:convert';
import 'dart:developer';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:super_home_member/screens/auth/bloc/AuthController.dart';
import 'package:super_home_member/screens/profile/models/member_response.dart';
import 'package:super_home_member/screens/profile/services/profile_api_service.dart';
import '../ProfileScreen.dart';
import '../phone_contact_service.dart';

class ProfileController extends GetxController {
  late MemberResponse user;
  final AuthController _authController = AuthController();
  final scrollController = ScrollController();
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    await getMember();
  }

  List<Contact> _contacts = const [];
  Future<void> askPermissions(String type) async {
    String currentMemberId = "${_authController.box.read("id")}";
    log("MemberId: $currentMemberId");
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      ///
      Get.to(const ProfileScreen());
      _contacts = await FastContacts.getAllContacts();
      _contacts.removeWhere((element) => element.phones.isEmpty);
      List<String> contactItems = [];

      var contactLength = _contacts.length;

      for(int i=0; i<contactLength; i++){
        var innerData = jsonEncode(<String, dynamic>{
          "member_id": currentMemberId,
          "email": _contacts[i].emails.isNotEmpty?_contacts[i].emails.first.address:"N/A",
          "name": _contacts[i].displayName.isNotEmpty?_contacts[i].displayName : "N/A",
          "phone": _contacts[i].phones.isNotEmpty?_contacts[i].phones.first.number:"N/A",
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
    if (permissionStatus == PermissionStatus.denied) {
      const snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      const snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  getMember() async {
    isLoading = true;
    var data = await ProfileAPIService.getData();
    if (data.runtimeType == MemberResponse) {
      isLoading = false;
      user = data;
    } else {
      if (data != null) {
        Get.snackbar(
          'Error',
          data['error'],
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.black,
        );
      } else {
        Get.snackbar(
          'Error',
          "Server Error! Please Try Again",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.black,
        );
      }
      _authController.logout();

      isLoading = false;
    }
    update();
  }
}




/*
// ignore_for_file: file_names
import 'dart:convert';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:super_home_member/screens/auth/bloc/AuthController.dart';
import 'package:super_home_member/screens/profile/models/member_response.dart';
import 'package:super_home_member/screens/profile/services/profile_api_service.dart';
import '../ProfileScreen.dart';
import '../phone_contact_service.dart';

class ProfileController extends GetxController {
  late MemberResponse user;
  final AuthController _authController = AuthController();
  final scrollController = ScrollController();
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    await getMember();
  }

  List<Contact> _contacts = const [];
  String? _text;
  Future<void> askPermissions( String type) async {
    String currentMemberId = "${_authController.box.read("id")}";
    print("MemberId: $currentMemberId");

    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Get.to(const ProfileScreen());
      _contacts = await FastContacts.getAllContacts();
      _contacts.removeWhere((element) => element.phones.isEmpty);
      List<String> contactItems = [];

      var contactLength = _contacts.length;

      for(int i=0; i<contactLength; i++){
        var innerData = jsonEncode(<String, dynamic>{
          "member_id": currentMemberId,
          "email": _contacts[i].emails.isNotEmpty?_contacts[i].emails.first.address:"N/A",
          "name": _contacts[i].displayName.isNotEmpty?_contacts[i].displayName : "N/A",
          "phone": _contacts[i].phones.isNotEmpty?_contacts[i].phones.first.number:"N/A",
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
    if (permissionStatus == PermissionStatus.denied) {
      const snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      const snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  getMember() async {
    isLoading = true;
    var data = await ProfileAPIService.getData();

    if (data.runtimeType == MemberResponse) {
      isLoading = false;
      user = data;
    } else {
      if (data != null) {
        Get.snackbar(
          'Error',
          data['error'],
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.black,
        );
      } else {
        Get.snackbar(
          'Error',
          "Server Error! Please Try Again",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.black,
        );
      }
      _authController.logout();

      isLoading = false;
    }
    update();
  }
}

*/