import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShippingAddress extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  const CardShippingAddress(
      {Key? key,
      required this.title,
      required this.body,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColor.secondaryColor : Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: isActive ? Colors.white : null),
        ),
        subtitle:
            Text(body, style: TextStyle(color: isActive ? Colors.white : null)),
      ),
    );
  }
}
