import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color:
              isActive == true ? AppColor.secondaryColor : AppColor.thirdColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
            height: 1,
            color: isActive == true ? Colors.white : AppColor.secondaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
