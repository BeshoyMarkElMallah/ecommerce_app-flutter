import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/notificationdata.dart';
import 'package:get/get.dart';

abstract class NotificationController extends GetxController {
  getData();
}

class NotificationControllerImp extends NotificationController {
  NotificationData notificationData = NotificationData(Get.find());

  List data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
