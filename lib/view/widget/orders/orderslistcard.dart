import 'package:ecommerce_app/controller/orders/pending_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingControllerImp> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number: #${listdata.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                // Text(listdata.ordersDatetime!)
                Text(
                  "${Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow()}",
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Text(
              "Order Type: ${controller.printTypeOrders(listdata.ordersType!)}",
            ),
            Text(
              "Order Price: ${listdata.ordersPrice} \$",
            ),
            Text(
              "Delivery Price: ${listdata.ordersPricedelivery} \$",
            ),
            Text(
                "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
            Text(
                "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text("Total Price : ${listdata.ordersTotalprice} \$",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold)),
                Spacer(),
                MaterialButton(
                  onPressed: () {},
                  child: const Text("Details"),
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondaryColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
