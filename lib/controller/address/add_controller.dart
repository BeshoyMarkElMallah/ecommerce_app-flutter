import 'dart:async';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddressController extends GetxController {
  getCurrentLocation();
  addMarkers(LatLng latlng);
  goToPageAddDetailsAddress();
}

class AddAddressControllerImp extends AddAddressController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController> completerController =
      Completer<GoogleMapController>();

  List<Marker> markers = [];

  Position? position;

  CameraPosition? kGooglePlex;

  double? lat;
  double? long;

  @override
  void onInit() {
    getCurrentLocation();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }

  @override
  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  addMarkers(LatLng latlng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latlng));
    lat = latlng.latitude;
    long = latlng.longitude;
    update();
  }

  @override
  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressadddetails,
        arguments: {"lat": lat, "long": long});
  }
}
