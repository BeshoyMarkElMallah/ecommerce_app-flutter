import 'dart:io';

import 'package:ecommerce_app/controller/homescreen_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/home/custombuttomappbarhome.dart';
import 'package:ecommerce_app/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomButtomAppBarHome(),
        body: WillPopScope(
            child: controller.listPage.elementAt(controller.currentPage),
            onWillPop: () {
              Get.defaultDialog(
                title: "Warning",
                titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.primaryColor),
                middleText: "Are you sure you want to exit?",
                onConfirm: () {
                  exit(0);
                },
                onCancel: () {},
                cancelTextColor: AppColor.secondaryColor,
                confirmTextColor: AppColor.secondaryColor,
                buttonColor: AppColor.thirdColor,
              );
              return Future.value(false);
            }),
      ),
    );
  }
}
