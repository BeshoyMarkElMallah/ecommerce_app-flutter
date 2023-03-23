import 'package:ecommerce_app/controller/address/add_controller.dart';
import 'package:ecommerce_app/controller/address/adddetails_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/shared/custombutton.dart';
import 'package:ecommerce_app/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextFormAuth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsControllerImp controller =
        Get.put(AddAddressDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address Details"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<AddAddressDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CustomTextFormAuth(
                    hinttext: "City",
                    labeltext: "City",
                    iconData: Icons.location_city,
                    mycontroller: controller.city,
                    valid: (val) {},
                    isNumber: false),
                CustomTextFormAuth(
                    hinttext: "Street",
                    labeltext: "Street",
                    iconData: Icons.location_city,
                    mycontroller: controller.street,
                    valid: (val) {},
                    isNumber: false),
                CustomTextFormAuth(
                    hinttext: "Name",
                    labeltext: "Address name",
                    iconData: Icons.location_city,
                    mycontroller: controller.name,
                    valid: (val) {},
                    isNumber: false),
                CustomButton(
                  text: "Add",
                  onPressed: () {
                    controller.addAddress();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
