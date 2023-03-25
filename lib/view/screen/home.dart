import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/home/customcardhome.dart';
import 'package:ecommerce_app/view/widget/home/customtitlehome.dart';
import 'package:ecommerce_app/view/widget/home/listcategorieshome.dart';
import 'package:ecommerce_app/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
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
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.settingdata.isNotEmpty)
                            CustomCardHome(
                                title:
                                    "${controller.settingdata[0]['settings_title']}",
                                body:
                                    "${controller.settingdata[0]['settings_description']}"),
                          CustomTitleHome(title: "Categories"),
                          ListCategoriesHome(),
                          CustomTitleHome(title: "Top Selling"),
                          ListItemsHome(),
                        ],
                      )
                    : ListItemsSearch(
                        listdatamodel: controller.listdata,
                      ))
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageStItems}/${listdatamodel[index].itemsImage}",
                        height: 100,
                        fit: BoxFit.fill,
                      )),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(translateDatabase(
                                listdatamodel[index].itemsNameAr,
                                listdatamodel[index].itemsName)),
                            subtitle: Text(translateDatabase(
                                listdatamodel[index].categoriesNameAr,
                                listdatamodel[index].categoriesNameAr)),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
