import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/screen/notification.dart';
import 'package:ecommerce_app/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const NotificationView(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Profile"),
        )
      ],
    ),
    const Settings(),
  ];

  List bottomappbar = [
    {
      "title": "Home",
      "icon": Icons.home,
    },
    {
      "title": "Notifications",
      "icon": Icons.notifications_active_outlined,
    },
    {
      "title": "Profile",
      "icon": Icons.person_pin_sharp,
    },
    {
      "title": "Settings",
      "icon": Icons.settings,
    },
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
