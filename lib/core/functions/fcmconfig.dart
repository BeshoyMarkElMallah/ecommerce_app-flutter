import 'package:ecommerce_app/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (await Permission.speech.isPermanentlyDenied) {
    openAppSettings();
  }
  print('User granted permission: ${settings.authorizationStatus}');
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification(looping: false);
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print("================================== pageid =====================");
  print(data['pageid']);
  print("================================== pagename =====================");
  print(data['pagename']);
  print(
      "================================== current route =====================");
  print(Get.currentRoute);
  if (Get.currentRoute == "/pendingorder" &&
      data['pagename'] == "refreshorderpending") {
    print("================================== order =====================");
    print("refresh order");
    Get.find<OrdersPendingControllerImp>().refreshOrder();
  }
}
