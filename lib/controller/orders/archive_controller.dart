import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/archive_data.dart';
import 'package:ecommerce_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';

abstract class OrdersArchiveController extends GetxController {
  getOrders();
  String printTypeOrders(String val);
  String printPaymentMethod(String val);
  String printOrderStatus(String val);
  refreshOrder();
  submitRating(String ordersid, double rating, String comment);
  // deleteOrders(String orderid);
}

class OrdersArchiveControllerImp extends OrdersArchiveController {
  ArchiveData archiveData = ArchiveData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveData
        .getData(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  @override
  printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash on Delivery";
    } else {
      return "Online Payment";
    }
  }

  @override
  String printTypeOrders(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Pickup";
    }
  }

  @override
  printOrderStatus(String val) {
    if (val == "0") {
      return "Archive";
    } else if (val == "1") {
      return "On Process";
    } else if (val == "2") {
      return "Ready to Picked up by delivery";
    } else if (val == "3") {
      return "on The Way";
    } else if (val == "4") {
      return "Delivered";
    } else {
      return "Canceled";
    }
  }

  @override
  refreshOrder() {
    getOrders();
  }

  @override
  submitRating(String ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await archiveData.rating(ordersid, comment, rating.toString());
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
