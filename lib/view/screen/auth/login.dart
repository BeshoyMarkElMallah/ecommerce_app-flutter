import 'package:ecommerce_app/controller/auth/login_controller.dart';
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

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Sign In',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    CustomTextTitleAuth(text: "10".tr),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextBodyAuth(
                      text: "11".tr,
                    ),
                    const SizedBox(
                      height: 15,
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
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => CustomTextFormAuth(
                        isNumber: false,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        obscureText: controller.isShowPassword,
                        valid: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        hinttext: "13".tr,
                        labeltext: "19".tr,
                        iconData: Icons.lock_outline,
                        mycontroller: controller.password,
                        // mycontroller: ,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: Text(
                        "14".tr,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    CustomButtonAuth(
                      text: "15".tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextSignUpOrSignIn(
                      text1: "16".tr,
                      text2: "17".tr,
                      onTap: () {
                        controller.goToSignUp();
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
