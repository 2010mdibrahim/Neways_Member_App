// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/Rental_info/RentalInfoScreen.dart';
import 'package:super_home_member/screens/bed_change/BedChangeScreen.dart';
import 'package:super_home_member/screens/booking_info/BookingInfoScreen.dart';
import 'package:super_home_member/screens/checkout_item/CheckoutItemScreen.dart';
import 'package:super_home_member/screens/collection/CollectionScreen.dart';
import 'package:super_home_member/screens/dining/DiningScreen.dart';
import 'package:super_home_member/screens/food_menu/FoodMenuScreen.dart';
import 'package:super_home_member/screens/home/widgets/GridViewList.dart';
import 'package:super_home_member/screens/package_shifting/PackageShiftingScreen.dart';
import 'package:super_home_member/screens/purchase_item/PurchaseItemScreen.dart';
import 'package:super_home_member/screens/request/bloc/ContactController.dart';
import 'package:super_home_member/screens/transactions/TransactionScreen.dart';

import '../../chat_with_us/chat_complain/chat_components/ComplainScreen.dart';
import '../../profile/bloc/ProfileController.dart';

class MemberProfileSection extends StatelessWidget {
  const MemberProfileSection({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: defaultPaddingEdge,
      width: double.infinity,
      decoration: const BoxDecoration(
          // color: Colors.white,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dashboard".toUpperCase(),
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black
            ),
          ),

          const SizedBox(height: defaultPadding / 2),
          GridView.count(
            crossAxisCount: size.width > 410 ? 4 : 3,
            crossAxisSpacing: defaultPadding / 2,
            mainAxisSpacing: defaultPadding / 2,
            shrinkWrap: true,
            controller: scrollController,
            children: [
              GridViewList(
                onPress: (() {
                  Get.put(ProfileController()).askPermissions("member");
                }),
                // image: controller.member.user.avater,
                image: 'assets/images/profile-icons.png',
                title: 'Profile',
              ),
              GridViewList(
                onPress: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookingInfoScreen()),
                  );
                }),
                image: 'assets/icons/booking.png',
                title: 'Booking Info',
              ),
              // GridViewList(
              //   onPress: (() {
              //     // ignore: avoid_print
              //     print('press');
              //   }),
              //   image: 'assets/icons/account.png',
              //   title: 'Account',
              // ),
              GridViewList(
                onPress: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RentalInfoScreen()),
                  );
                }),
                image: 'assets/icons/rental.png',
                title: 'Rental Info',
              ),
              GridViewList(
                onPress: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PurchaseItemScreen()),
                  );
                }),
                image: 'assets/icons/purchase.png',
                title: 'Purchase Item',
              ),
              GridViewList(
                onPress: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PackageShiftingScreen()),
                  );
                }),
                image: 'assets/icons/package_shifting.png',
                title: 'Package Shifting',
              ),
              GridViewList(
                onPress: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BedChangeScreen()),
                  );
                }),
                image: 'assets/icons/bed_change.png',
                title: 'Bed Change',
              ),
              GridViewList(
                onPress: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TransactionScreen()),
                  );
                }),
                image: 'assets/icons/transaction.png',
                title: 'Transaction',
              ),
              GridViewList(
                onPress: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CollectionScreen()),
                  );
                }),
                image: 'assets/icons/collection.png',
                title: 'All Collection',
              ),
              GridViewList(
                onPress: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DiningScreen()),
                  );
                }),
                image: 'assets/icons/dining.png',
                title: 'Dining',
              ),
              GridViewList(
                onPress: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FoodMenuScreen()),
                  );
                }),
                image: 'assets/icons/food_menu.png',
                title: 'Food Menu',
              ),
              GridViewList(
                onPress: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CheckoutItemScreen()),
                  );
                }),
                image: 'assets/icons/checkout.png',
                title: 'Checkout Items',
              ),
              // GridViewList(
              //   onPress: (() {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const MemberCancelationScreen()),
              //     );
              //   }),
              //   image: 'assets/icons/cancelation.png',
              //   title: 'Member Cancelation',
              // ),
              GridViewList(
                onPress: (() {
                  Get.put(ContactController()).askPermissions(context);
                  // Get.to(RequestScreen());
                }),
                image: 'assets/icons/request.png',
                title: 'Request',
              ),


            ],
          ),
        ],
      ),
    );
  }
}
