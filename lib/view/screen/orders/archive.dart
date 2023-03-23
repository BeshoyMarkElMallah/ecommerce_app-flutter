import 'package:ecommerce_app/controller/orders/archive_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/ordersmodel.dart';
import 'package:ecommerce_app/view/widget/orders/orderslistcard.dart';
import 'package:ecommerce_app/view/widget/orders/orderslistcardArchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CardOrdersListArchive(
                      listdata: controller.data[index],
                    );
                  }),
            ),
          )),
    );
  }
}
