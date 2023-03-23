import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/view/widget/cart/customBottomnavigationbarcart.dart';
import 'package:ecommerce_app/view/widget/cart/customitemscartlist.dart';
import 'package:ecommerce_app/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartControllerImp cartcontroller = Get.put(CartControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      bottomNavigationBar: GetBuilder<CartControllerImp>(
        builder: (controller) => BottomNavigationBarCart(
          price: "${controller.priceorders}",
          discount: "${controller.discountCoupon}",
          totalprice: "${controller.getTotalPrice()}",
          controllerCoupon: controller.controllercoupon!,
          onPressedCoupon: () {
            controller.checkCoupon();
          },
          shipping: '0',
        ),
      ),
      body: GetBuilder<CartControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              TopCardCart(
                  message:
                      "You Have ${controller.totalcountitems} Items in Your List"),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                        cartcontroller.data.length,
                        (index) => CustomItemsCartList(
                              name:
                                  "${translateDatabase(cartcontroller.data[index].itemsNameAr, cartcontroller.data[index].itemsName)}",
                              price:
                                  "${cartcontroller.data[index].itemsprice} \$",
                              count: "${cartcontroller.data[index].countitems}",
                              imgname:
                                  '${cartcontroller.data[index].itemsImage}',
                              onAdd: () async {
                                await cartcontroller
                                    .add(cartcontroller.data[index].itemsId!);
                                cartcontroller.refreshPage();
                              },
                              onRemove: () async {
                                await cartcontroller.delete(
                                    cartcontroller.data[index].itemsId!);
                                cartcontroller.refreshPage();
                              },
                            ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
