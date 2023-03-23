import 'package:ecommerce_app/controller/productdetails_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/view/widget/productdetails/priceandcount.dart';
import 'package:ecommerce_app/view/widget/productdetails/subitemslist.dart';
import 'package:ecommerce_app/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.secondaryColor,
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: const Text(
            "Add to Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const TopProductPageDetails(),
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${translateDatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: AppColor.fourthColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PriceAndCountItems(
                        onAdd: () {
                          controller.add();
                        },
                        onRemove: () {
                          controller.remove();
                        },
                        price: controller.itemsModel.itemsPriceDiscount!,
                        count: "${controller.countitems}"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${translateDatabase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Text(
                    //   "Color",
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .headline1!
                    //       .copyWith(color: AppColor.fourthColor),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const SubItemsList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
