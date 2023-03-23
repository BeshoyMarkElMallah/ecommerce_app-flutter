import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/addressdata.dart';
import 'package:ecommerce_app/data/model/addressmodel.dart';
import 'package:get/get.dart';

abstract class AddressViewController extends GetxController {
  getData();
  deleteAdress(String addressid);
}

class AddressViewControllerImp extends AddressViewController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteAdress(String addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.id == addressid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
