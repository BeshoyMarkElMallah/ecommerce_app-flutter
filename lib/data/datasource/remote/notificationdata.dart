import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData(usersid) async {
    var response =
        await crud.postData(AppLink.notification, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
