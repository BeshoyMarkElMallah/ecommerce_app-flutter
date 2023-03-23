import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartAdd,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartDelete,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartGetCountItems,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response =
        await crud.postData(AppLink.cartView, {"usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"couponname": couponName});
    return response.fold((l) => l, (r) => r);
  }
}
