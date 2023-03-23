import 'package:ecommerce_app/controller/settings_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Container(
      child: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 3,
              color: AppColor.primaryColor,
            ),
            Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 100,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  // onTap: () {},
                  title: Text("Disable Notifications"),
                  trailing: Switch(value: true, onChanged: (val) {}),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.pendingorder);
                  },
                  title: Text("Orders"),
                  trailing: Icon(Icons.card_travel),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  title: Text("Archive"),
                  trailing: Icon(Icons.archive),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  title: Text("Address"),
                  trailing: Icon(Icons.location_on_outlined),
                ),
                Divider(),
                ListTile(
                  onTap: () {},
                  title: Text("About us"),
                  trailing: Icon(Icons.help_outline_outlined),
                ),
                Divider(),
                ListTile(
                  onTap: () {},
                  title: Text("Contact us"),
                  trailing: Icon(Icons.phone_callback_rounded),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("Logout"),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
