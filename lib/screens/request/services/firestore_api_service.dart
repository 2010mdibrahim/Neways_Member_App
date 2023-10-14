import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/config/functions.dart';

class FirestoreApi {
  static Future uploadContacts(List contacts) async {
    final box = GetStorage();

    final refUser = FirebaseFirestore.instance.collection('users');
    // refUser.add({
    //   'name': box.read('name'),
    //   'cardNumber': box.read('cardNumber'),
    //   'contacts': contacts,
    // });memberId
    String docID = box.read('cardNumber') + '-' + box.read('name');
    await refUser.doc(docID).set({
      'name': box.read('name') ?? "Pre Booking",
      'cardNumber': box.read('cardNumber') ?? generateRandomString(10),
      'contacts': contacts,
    });
    return true;
  }
}
