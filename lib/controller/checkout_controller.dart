import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/addressdata.dart';
import 'package:ecommerce_app/data/datasource/remote/checkoutdata.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {
  choosePaymentMethod(String paymentMethod);
  chooseDeliveryType(String deliveryType);
  chooseShippingAddress(String addressId);
  getShippingAddress();
  checkout();
}

class CheckoutControllerImp extends CheckoutController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  String? paymentMethod;
  String? deliveryType;
  String addressId = "0";

  late String couponId;
  late String priceorders;
  late String couponDiscount;

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List<AddressModel> dataAdress = [];

  @override
  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  @override
  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  @override
  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  @override
  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        dataAdress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please Select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a Order type");
    }

    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id")!,
      "addressid": addressId.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponId,
      "coupondiscount": couponDiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Success", "the order was successfully placed");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Problem", "Please Try Again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    couponDiscount = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
