import 'dart:async';

import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/details_data.dart';
import 'package:ecommerce_app/data/model/cartmodel.dart';
import 'package:ecommerce_app/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class OrdersDetailsController extends GetxController {
  initialData();
  getData();
}

class OrdersDetailsControllerImp extends OrdersDetailsController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];
  late StatusRequest statusRequest;

  late OrdersModel ordersModel;

  Completer<GoogleMapController> completerController =
      Completer<GoogleMapController>();

  List<Marker> markers = [];

  Position? position;

  CameraPosition? cameraPosition;

  double? lat;
  double? long;

  @override
  initialData() {
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!))));
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getData(ordersModel.ordersId!);
    print("hello thereeeee");
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
