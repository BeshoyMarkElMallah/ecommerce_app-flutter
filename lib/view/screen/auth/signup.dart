import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/core/functions/alertexitapp.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextBodyAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextFormAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_app/view/widget/auth/logoAuth.dart';
import 'package:ecommerce_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '17'.tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    CustomTextTitleAuth(text: "10".tr),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextBodyAuth(
                      text: "24".tr,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 50, "username");
                      },
                      hinttext: "23".tr,
                      labeltext: "20".tr,
                      iconData: Icons.person_outline,
                      mycontroller: controller.username,
                      // mycontroller: ,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      hinttext: "12".tr,
                      labeltext: "18".tr,
                      iconData: Icons.email_outlined,
                      mycontroller: controller.email,
                      // mycontroller: ,
                    ),
                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 3, 12, "phone");
                      },
                      hinttext: "22".tr,
                      labeltext: "21".tr,
                      iconData: Icons.phone_android_outlined,
                      mycontroller: controller.phone,
                      // mycontroller: ,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      hinttext: "13".tr,
                      labeltext: "19".tr,
                      iconData: Icons.lock_outline,
                      mycontroller: controller.password,
                      // mycontroller: ,
                    ),
                    CustomButtonAuth(
                      text: "17".tr,
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextSignUpOrSignIn(
                      text1: "25".tr,
                      text2: "26".tr,
                      onTap: () {
                        controller.goToLogin();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
