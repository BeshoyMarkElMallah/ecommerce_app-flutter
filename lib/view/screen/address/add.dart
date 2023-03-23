import 'package:ecommerce_app/controller/address/add_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/auth/customButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressControllerImp controllerpage = Get.put(AddAddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Add New Address"),
      ),
      body: Container(
          child: GetBuilder<AddAddressControllerImp>(
        builder: (controllerpage) => HandlingDataView(
          statusRequest: controllerpage.statusRequest,
          widget: Column(
            children: [
              if (controllerpage.kGooglePlex != null)
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: controllerpage.markers.toSet(),
                        onTap: (latlong) {
                          controllerpage.addMarkers(latlong);
                        },
                        initialCameraPosition: controllerpage.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controllerpage.completerController
                              .complete(controllermap);
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          child: MaterialButton(
                            minWidth: 200,
                            onPressed: () {
                              controllerpage.goToPageAddDetailsAddress();
                            },
                            color: AppColor.primaryColor,
                            textColor: Colors.white,
                            child: const Text(
                              "Complete",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
