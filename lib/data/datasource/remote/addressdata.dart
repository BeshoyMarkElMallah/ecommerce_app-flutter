import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.addressView, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String userid, String address, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": userid,
      "addressname": address,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response = await crud.postData(AppLink.addressDelete, {
      "addressid": addressid,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData() async {
    var response = await crud.postData(AppLink.addressEdit, {});
    return response.fold((l) => l, (r) => r);
  }
}
