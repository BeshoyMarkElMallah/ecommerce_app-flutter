import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommerce_app/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommerce_app/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          color: AppColor.secondaryColor,
          textColor: Colors.white,
          onPressed: () {
            controller.checkout();
          },
          child: const Text(
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: GetBuilder<CheckoutControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const Text(
                    "Choose Payment Method",
                    style: TextStyle(
                        color: AppColor.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller
                          .choosePaymentMethod("0"); // 0==> cash on delivery
                    },
                    child: CardPaymentMethodCheckout(
                        title: "Cash on Delivery",
                        isActive:
                            controller.paymentMethod == "0" ? true : false),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.choosePaymentMethod("1"); // 1==> payment card
                    },
                    child: CardPaymentMethodCheckout(
                        title: "Payment Card",
                        isActive:
                            controller.paymentMethod == "1" ? true : false),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Choose Delivery Type",
                    style: TextStyle(
                        color: AppColor.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType("0"); //0 ==> delivery
                        },
                        child: CardDeliveryTypeCheckout(
                            imageName: AppImageAsset.deliveryImage2,
                            title: "Delivery",
                            isActive:
                                controller.deliveryType == "0" ? true : false),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType("1"); // 1 ==> drivethru
                        },
                        child: CardDeliveryTypeCheckout(
                            imageName: AppImageAsset.drivethruImage,
                            title: "Drive Thru",
                            isActive:
                                controller.deliveryType == "1" ? true : false),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  controller.deliveryType == "0"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Shipping Address",
                              style: TextStyle(
                                  color: AppColor.secondaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ...List.generate(
                                controller.dataAdress.length,
                                (index) => InkWell(
                                      onTap: () {
                                        controller.chooseShippingAddress(
                                            controller.dataAdress[index].id!);
                                      },
                                      child: CardShippingAddress(
                                        title: controller
                                            .dataAdress[index].addressName!,
                                        body:
                                            "${controller.dataAdress[index].addressCity!} ${controller.dataAdress[index].addressStreet!} ",
                                        isActive: controller.addressId ==
                                                controller.dataAdress[index].id!
                                            ? true
                                            : false,
                                      ),
                                    )),
                          ],
                        )
                      : Container(),
                ],
              )),
        ),
      ),
    );
  }
}
