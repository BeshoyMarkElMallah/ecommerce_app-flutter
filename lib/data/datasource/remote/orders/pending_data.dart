import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class PendingData {
  Crud crud;
  PendingData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.pendingorder, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
