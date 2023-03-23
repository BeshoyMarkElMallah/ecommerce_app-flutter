import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String catid, String usersid) async {
    var response = await crud.postData(
        AppLink.items, {"id": catid.toString(), "usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
