import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cartdata.dart';
import 'package:ecommerce_app/data/model/cartmodel.dart';
import 'package:ecommerce_app/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  add(String itemsid);
  delete(String itemsid);
  view();
  getCountItems(String itemsid);
  resetVarCart();
  refreshPage();
  checkCoupon();
  getTotalPrice();
  goToPageCheckout();
}

class CartControllerImp extends CartController {
  TextEditingController? controllercoupon;

  CartData cartData = CartData(Get.find());

  int? discountCoupon = 0;
  String? couponName;
  String? couponid;

  List<CartModel> data = [];
  CouponModel? couponModel;

  double priceorders = 0.0;
  int totalcountitems = 0;

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "Successfull",
            messageText: const Text("item added to cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "Successfull",
            messageText: const Text("item removed from cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders = double.parse(dataresponsecountprice['totalprice']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("===========>>>>>> $countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllercoupon!.text);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountCoupon = int.parse(couponModel!.couponDiscount!);
        couponName = couponModel!.couponName;
        couponid = couponModel!.couponId;
        print("===========>>>>>> $datacoupon");
      } else {
        // statusRequest = StatusRequest.success;
        print("===========>>>>>> erorrrrr");
        discountCoupon = 0;
        couponName = null;
        couponid = null;
        Get.snackbar("Warning", "Coupon Not Valid");
      }
    }
    update();
  }

  @override
  getTotalPrice() {
    return priceorders - priceorders * discountCoupon! / 100;
  }

  @override
  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0;
    data.clear();
  }

  @override
  refreshPage() {
    resetVarCart();
    view();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }

  @override
  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("Warning", "the cart is Empty");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString(),
      "discountcoupon": discountCoupon.toString(),
    });
  }
}
