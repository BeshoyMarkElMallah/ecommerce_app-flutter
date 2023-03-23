import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imageName;
  final String title;
  final bool isActive;
  const CardDeliveryTypeCheckout(
      {super.key,
      required this.imageName,
      required this.title,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: isActive ? AppColor.secondaryColor : null,
          border: Border.all(color: AppColor.secondaryColor),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageName,
            width: 60,
            color: isActive ? Colors.white : null,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : AppColor.secondaryColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
