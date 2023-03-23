class AppLink {
  static const String server = "http://192.168.1.11:8080/ecommerce";

  //========================= Image =========================//

  static const String imageStatic = "$server/upload";
  static const String imageStCategories = "$imageStatic/categories";
  static const String imageStItems = "$imageStatic/items";

  //========================= Test =========================//

  static const String test = "$server/test.php";
  static const String notification = "$server/notification.php";

  //========================= Auth =========================//
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycode = "$server/auth/verifycode.php";
  static const String resend = "$server/auth/resend.php";

  //========================= ForgetPassword =========================//

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

  //========================= Home =========================//

  static const String homepage = "$server/home.php";

  //========================= Items =========================//

  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";

  //========================= Favorite =========================//

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteFromFavorite =
      "$server/favorite/deletefavorite.php";

//========================= Cart =========================//

  static const String cartView = "$server/cart/view.php";
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartGetCountItems = "$server/cart/getcountitems.php";

  //========================= Cart =========================//

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  //========================= Coupon =========================//

  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  //========================= Checkout =========================//

  static const String checkout = "$server/orders/checkout.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String pendingorder = "$server/orders/pending.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";

  //========================= Offers =========================//
  static const String offers = "$server/offers.php";
}
