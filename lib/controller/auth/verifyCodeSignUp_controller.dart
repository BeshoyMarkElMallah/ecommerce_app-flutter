import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/verifyCodeSignup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
  resend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifycodedata = VerifyCodeSignUpData(Get.find());

  String? email;

  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodedata.postdata(email!, verificationCode);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print("Success");
        Get.offNamed(AppRoute.successSignUp);
      } else {
        print("failed");
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  resend() {
    verifycodedata.resendData(email!);
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
