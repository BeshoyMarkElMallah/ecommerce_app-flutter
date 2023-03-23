import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController pass;
  late TextEditingController repass;

  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() async {
    if (pass.text != repass.text) {
      return Get.defaultDialog(
          title: "Warning", middleText: "Password Not Match");
    }
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(
        email!,
        pass.text,
      );
      print(response);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Try Again");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void dispose() {
    pass.dispose();
    repass.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    pass = TextEditingController();
    repass = TextEditingController();
    super.onInit();
  }
}
