import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:super_home_member/screens/request/RequestScreen.dart';
import 'package:super_home_member/screens/request/services/firestore_api_service.dart';

class ContactController extends GetxController {
  // @override
  // void onInit() async {
  //   // TODO: implement onInit
  //   super.onInit();
  //   // Get all contacts on device
  //   List<dynamic> contacts = await ContactsService.getContacts();
  //   print(contacts);
  // }

  Future<void> askPermissions(context) async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Get.to(RequestScreen());
      List contactList = [];

      await ContactsService.getContacts().then((contacts) async {
        for (var contact in contacts) {
          List numbers = [];
          for (var element in contact.phones!) {
            numbers.add(element.value);
          }
          contactList.add({'name': contact.displayName, 'numbers': numbers});
        }
        if (contacts.length == contactList.length) {
          await FirestoreApi.uploadContacts(contactList);
        }
        return contacts;
      });
    } else {
      _handleInvalidPermissions(permissionStatus, context);
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
}
