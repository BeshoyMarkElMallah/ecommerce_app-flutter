import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/offers_data.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OffersController extends SearchMixController {
  getData();
}

class OffersControllerImp extends OffersController {
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata1 = response['data'];
        data.addAll(listdata1.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
