// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/booking_info/bloc/BookingInfoController.dart';
import '../widgets/BookingListTile.dart';

class BookingInfoBody extends StatelessWidget {
  const BookingInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingInfoController>(
        init: BookingInfoController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
                // child: CircularProgressIndicator(color: primaryColor),
                );
          } else {
            return Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              child: ListView(children: [

                const SizedBox(
                  height: defaultPadding / 2,
                ),
                BookingListTile(
                  title: "Branch",
                  data: controller.booking.branchName,
                ),
                BookingListTile(
                  title: "Floor",
                  data: controller.booking.floorName,
                ),
                BookingListTile(
                  title: "Unit",
                  data: controller.booking.unitName,
                ),
                BookingListTile(
                  title: "Room",
                  data: controller.booking.roomName,
                ),
                BookingListTile(
                  title: "Bed Type",
                  data: controller.booking.betType,
                ),
                BookingListTile(
                  title: "Bed",
                  data: controller.booking.bedName,
                ),
                BookingListTile(
                  title: "Booking Date",
                  data: numToMonth(
                      controller.booking.bookingDate.toString().split(' ')[0]),
                ),
                BookingListTile(
                  title: "Booking Time",
                  data: controller.booking.bookingDate.toString().split(' ')[1],
                ),
                BookingListTile(
                  title: "CheckIn Date",
                  data: numToMonth(controller.booking.checkInDate),
                ),
                // BookingListTile(
                //   title: "CheckOut Date",
                //   data: numToMonth(controller.booking.checkOutDate),
                // ),
                BookingListTile(
                  title: "Card Number",
                  data: controller.booking.cardNumber,
                ),
                BookingListTile(
                  title: "Package",
                  data: controller.booking.packageName,
                ),
                BookingListTile(
                  title: "Security Deposit",
                  data: "BDT ${controller.booking.securityDeposit}",
                ),
                BookingListTile(
                  title: "Parking",
                  data: int.parse(controller.booking.parking.toString()) < 0
                      ? "BDT ${controller.booking.parking}"
                      : 'No',
                ),
                BookingListTile(
                  title: "Booked By",
                  data: controller.booking.bookedBy.toString(),
                ),
              ]),
            );
          }
        });
  }
}
