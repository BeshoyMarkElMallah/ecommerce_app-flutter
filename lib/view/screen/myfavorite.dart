import 'package:ecommerce_app/controller/myfavorite_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteControllerImp>(
          builder: (controller) => ListView(children: [
            // CustomAppBar(
            //   titleappbar: "Find Product",
            //   onPressedSearch: () {},
            //   onPressedIconFavorite: () {
            //     Get.toNamed(AppRoute.myfavorite);
            //   },
            // ),
            const SizedBox(
              height: 20,
            ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, int index) {
                    return CustomListFavoriteItems(
                        itemsModel: controller.data[index]);
                  },
                )),
          ]),
        ),
      ),
    );
  }
}
