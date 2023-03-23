import 'package:ecommerce_app/controller/address/view_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewControllerImp controller = Get.put(AddressViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Addresses"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<AddressViewControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return CardAddress(
                addressModel: controller.data[index],
                onDelete: () {
                  controller.deleteAdress(controller.data[index].id!);
                },
              );
            },
            itemCount: controller.data.length,
          )),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({Key? key, required this.addressModel, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Text(addressModel.addressName!),
            subtitle: Text(
                "${addressModel.addressCity!} ${addressModel.addressStreet!}"),
            trailing: IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete_outlined),
            ),
          )),
    );
  }
}
