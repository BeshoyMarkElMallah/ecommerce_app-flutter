import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imgname;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imgname,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageStItems}/$imgname",
                  height: 80,
                )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    name,
                    style: const TextStyle(fontSize: 15),
                  ),
                  subtitle: Text(
                    price,
                    style: const TextStyle(
                        color: AppColor.primaryColor, fontSize: 17),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                Container(
                  height: 30,
                  child:
                      IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
                ),
                Container(
                    child: Text(
                  count,
                  style: const TextStyle(fontFamily: 'sans'),
                )),
                Container(
                  height: 30,
                  child: IconButton(
                      onPressed: onRemove, icon: const Icon(Icons.remove)),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
