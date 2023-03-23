import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.ordersarchive, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
