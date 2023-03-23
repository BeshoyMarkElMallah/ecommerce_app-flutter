import 'package:ecommerce_app/controller/forgetpassword/forgetPassword_controller.dart';
import 'package:ecommerce_app/controller/auth/verifyCodeSignUp_controller.dart';
import 'package:ecommerce_app/controller/forgetpassword/verifyCode_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextBodyAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextFormAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_app/view/widget/auth/logoAuth.dart';
import 'package:ecommerce_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller =
        Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Verification Code',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(
              children: [
                const CustomTextTitleAuth(text: "Check code"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextBodyAuth(
                  text:
                      "Please Enter The Digit Cide Sent To ${controller.email!}",
                ),
                const SizedBox(
                  height: 15,
                ),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    print(verificationCode);
                    controller.goToSuccessSignUp(verificationCode);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    controller.resend();
                  },
                  child: const Center(
                      child: Text(
                    "Resend verify code",
                    style:
                        TextStyle(color: AppColor.primaryColor, fontSize: 22),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
