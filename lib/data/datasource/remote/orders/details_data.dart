import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getData(String ordersid) async {
    var response = await crud.postData(AppLink.ordersdetails, {
      "ordersid": ordersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
