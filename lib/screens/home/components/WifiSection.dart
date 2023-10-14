import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:get/get.dart';
import '../../wifi/controller/MyWifiController.dart';

class WifiSection extends StatefulWidget {
  final MyWifiController myWifiController = Get.put(MyWifiController());

  WifiSection({
    Key? key,
  }) : super(key: key);

  @override
  State<WifiSection> createState() => _WifiSectionState();
}

class _WifiSectionState extends State<WifiSection> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3,0,3,0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(defaultPadding / 4),
        padding: const EdgeInsets.all(defaultPadding/2),
        decoration:  BoxDecoration(
          color: Colors.cyan[300],
          image: DecorationImage(
            colorFilter:  ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
            image: const AssetImage("assets/images/wiFi-background.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey.shade400,
                direction: ShimmerDirection.btt,
                child: const Icon(
                  Icons.wifi_outlined,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Wifi Connection".toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    // This bool value toggles the switch.
                    value: widget.myWifiController.wifiAutoConnect,
                    activeColor: Colors.blue,
                    inactiveTrackColor: Colors.red,
                    onChanged: (bool value) {
                      setState(() {
                        widget.myWifiController.initializeMyWifiController(context);
                        widget.myWifiController.wifiAutoConnect = value;
                        widget.myWifiController.isWifiConnecting = !value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
