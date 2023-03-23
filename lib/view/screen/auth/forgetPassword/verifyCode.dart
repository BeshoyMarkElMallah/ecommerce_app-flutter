import 'package:ecommerce_app/controller/forgetpassword/forgetPassword_controller.dart';
import 'package:ecommerce_app/controller/forgetpassword/verifyCode_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextBodyAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextFormAuth.dart';
import 'package:ecommerce_app/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_app/view/widget/auth/logoAuth.dart';
import 'package:ecommerce_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const CustomTextTitleAuth(text: "Check code"),
            const SizedBox(
              height: 10,
            ),
            const CustomTextBodyAuth(
              text: "Please Enter The Digit Cide Sent To Your Email",
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
                controller.checkCode(verificationCode);
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
