// ignore_for_file: avoid_types_as_parameter_names
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

String numToMonth(String date) {
  var strList = date.split('/');
  return "${strList[0]} ${getMonth(strList[1])} ${strList[2]}";
}

String numToMonth2(String date, {bool isReverse = false}) {
  var strList = date.split('-');
  return isReverse == true
      ? "${strList[2]} ${getMonth(strList[1])} ${strList[0]}"
      : "${strList[0]} ${getMonth(strList[1])} ${strList[2]}";
}

String getMonth(num, {bool isFullName = false}) {
  if (num == '01' || num == '1' || num == 1) {
    return isFullName ? "January" : "Jan";
  } else if (num == '02' || num == '2' || num == 2) {
    return isFullName ? "February" : "Feb";
  } else if (num == '03' || num == '3' || num == 3) {
    return isFullName ? "March" : "March";
  } else if (num == '04' || num == '4' || num == 4) {
    return isFullName ? "April" : "April";
  } else if (num == '05' || num == '5' || num == 5) {
    return isFullName ? "May" : "May";
  } else if (num == '06' || num == '6' || num == 6) {
    return isFullName ? "June" : "Jun";
  } else if (num == '07' || num == '7' || num == 7) {
    return isFullName ? "July" : "July";
  } else if (num == '08' || num == '8' || num == 8) {
    return isFullName ? "August" : "Aug";
  } else if (num == '09' || num == '9' || num == 9) {
    return isFullName ? "September" : "Sep";
  } else if (num == '10' || num == 10) {
    return isFullName ? "October" : "Oct";
  } else if (num == '11' || num == 11) {
    return isFullName ? "November" : "Nav";
  } else if (num == '12' || num == 12) {
    return isFullName ? "December" : "Dec";
  } else {
    return "NoN";
  }
}

Future<void> launchInWebViewOrVC({authority, path, title}) async {
  Uri url = Uri.http(authority ?? 'superhomebd.com', path);
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
    webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: true,
        enableDomStorage: true,
        headers: <String, String>{'my_header_key': 'my_header_value'}),
  )) {
    throw 'Could not launch $url';
  }
}

Future openBox(category) async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  return await Hive.openBox(category);
}

void notify({id, required title, required body, img}) async {
  if (img != null) {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id ?? DateTime.now().second,
          channelKey: 'channelKey1',
          title: title,
          body: body,
          bigPicture: img,
          notificationLayout: NotificationLayout.Default),
    );
  } else {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id ?? DateTime.now().second,
          channelKey: 'channelKey1',
          title: title,
          body: body,
          notificationLayout: NotificationLayout.BigText),
    );
  }

  // AwesomeNotifications().actionStream.listen((event) {
  //   Get.to(const NotificationScreen());
  // });
}

void scheduleNotification(
    {id,
    required String title,
    required String body,
    int interval = 86400}) async {
  String localTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id ?? DateTime.now().second + DateTime.now().minute,
          channelKey: 'channelKey1',
          title: title,
          body: body,
          notificationLayout: NotificationLayout.BigText),
      schedule: NotificationInterval(
          interval: interval, timeZone: localTimeZone, repeats: true));
}

void scheduleNotificationTest() async {
  String localTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: DateTime.now().second + DateTime.now().minute,
          channelKey: 'channelKey1',
          title: 'Notification at every single minute',
          body:
              'This notification was schedule to repeat at every single minute. ${DateTime.now()}',
          notificationLayout: NotificationLayout.BigText),
      schedule: NotificationInterval(
          interval: 60, timeZone: localTimeZone, repeats: true));
}

int timeDuration({required String duration, isHour = false, isMinute = false}) {
  var now = DateTime.now();
  int day = now.day;
  int hour = now.hour;
  if (duration == "breakfast") {
    if (now.hour >= 7) {
      final tomorrow = DateTime(now.year, now.month, now.day + 1);
      day = tomorrow.day;
    }
    hour = 7;
  } else if (duration == "lunch") {
    if (now.hour >= 13) {
      final tomorrow = DateTime(now.year, now.month, now.day + 1);
      day = tomorrow.day;
    }
    hour = 13;
  } else if (duration == "dinner") {
    if (now.hour >= 20) {
      final tomorrow = DateTime(now.year, now.month, now.day + 1);
      day = tomorrow.day;
    }
    hour = 20;
  }

  var hours = DateTime(now.year, now.month, now.day, now.hour, now.minute)
      .difference(DateTime(now.year, now.month, day, hour, 00))
      .inHours
      .abs();
  var minutes = (DateTime(now.year, now.month, now.day, now.hour, now.minute)
              .difference(DateTime(now.year, now.month, day, hour, 00))
              .inMinutes)
          .abs() -
      (hours * 60);
  if (isHour) {
    return hours;
  } else if (isMinute) {
    return minutes;
  } else {
    return 0;
  }
}
String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}