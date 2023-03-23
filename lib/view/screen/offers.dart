import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/offers_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/items/customlistitems.dart';
import 'package:ecommerce_app/view/widget/offers/customitemsoffer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OffersControllerImp controller = Get.put(OffersControllerImp());
    FavoriteControllerImp favController = Get.put(FavoriteControllerImp());
    return GetBuilder<OffersControllerImp>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(children: [
                CustomAppBar(
                  titleappbar: "Find Product",
                  onPressedSearch: () {
                    controller.onSearchItems();
                  },
                  onPressedIconFavorite: () {
                    Get.toNamed(AppRoute.myfavorite);
                  },
                  mycontroller: controller.search!,
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                !controller.isSearch
                    ? HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return CustomListItemsOffers(
                                  itemsModel: controller.data[index]);
                            }))
                    : ListItemsSearch(listdatamodel: controller.listdata),
              ]),
            ));
  }
}
