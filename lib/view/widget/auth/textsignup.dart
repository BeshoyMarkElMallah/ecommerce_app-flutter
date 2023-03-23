import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const CustomTextSignUpOrSignIn({
    Key? key,
    required this.text1,
    required this.text2,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
