import 'package:ecommerce_app/controller/forgetpassword/resetPassword_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextBodyAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextFormAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextTitleAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextTitleAuth(text: "35".tr),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextBodyAuth(
                    text: "35".tr,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    hinttext: "13".tr,
                    labeltext: "19".tr,
                    iconData: Icons.lock_outline,
                    mycontroller: controller.pass,
                    // mycontroller: ,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    hinttext: "Re" + " " + "13".tr,
                    labeltext: "19".tr,
                    iconData: Icons.lock_outline,
                    mycontroller: controller.repass,
                    // mycontroller: ,
                  ),
                  CustomButtonAuth(
                    text: "33".tr,
                    onPressed: () {
                      controller.goToSuccessResetPassword();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
