// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/live_tv/domain/live_tv_stream_model.dart';

class LiveTVStreamingScreen extends StatefulWidget {
  LiveTvStreamModel tv;
  LiveTVStreamingScreen({Key? key, required this.tv}) : super(key: key);

  @override
  State<LiveTVStreamingScreen> createState() => _LiveTVStreamingScreenState();
}

class _LiveTVStreamingScreenState extends State<LiveTVStreamingScreen> {
  late VlcPlayerController _videoPlayerController;
  Future<void> initializePlayer() async {}
  bool isRoted = false;
  bool isPlay = true;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VlcPlayerController.network(
      widget.tv.src,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    // await _videoViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    if (isRoted) {
      Future.delayed(const Duration(milliseconds: 250), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => super.widget));
      });
    } else {
      setState(() {
        isRoted = true;
      });
    }
    if (!isPortrait) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.white.withOpacity(0.0),
          statusBarIconBrightness: Brightness.dark));
      return videoScreen();
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(left: defaultPadding / 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultPadding / 2),
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.arrow_back, color: primaryColor),
                  ),
                ),
                const Expanded(
                    child: Text(
                  "Live TV",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ))
              ],
            ),
            const SizedBox(height: defaultPadding),
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              child: videoScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget videoScreen() {
    return Center(
      child: Expanded(
        child: VlcPlayer(
          controller: _videoPlayerController,
          aspectRatio: 16 / 9,
          placeholder: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
