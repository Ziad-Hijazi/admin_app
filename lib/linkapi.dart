class AppLink {
  static const String server = "https://smartshopziad.000webhostapp.com/admin";
  static const String login = "$server/auth/login.php";
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String imagesRoot =
      "https://smartshopziad.000webhostapp.com/upload";
  static const String imagesCategories = "$imagesRoot/categories";
  static const String imagesItems = "$imagesRoot/items";


  static const String approveOrders = "$server/orders/approve.php";
  static const String prepareOrders = "$server/orders/prepare.php";


  static const String viewpendingOrders = "$server/orders/viewpending.php";
  static const String viewacceptedOrders = "$server/orders/viewaccepted.php";
  static const String detailsOrders = "$server/orders/details.php";
  static const String viewarchiveOrders = "$server/orders/archive.php";



  static const String addCategories = "$server/categories/add.php";
  static const String editCategories = "$server/categories/edit.php";
  static const String viewCategories = "$server/categories/view.php";
  static const String deleteCategories = "$server/categories/delete.php";

  static const String addItems = "$server/items/add.php";
  static const String editItems = "$server/items/edit.php";
  static const String viewItems = "$server/items/view.php";
  static const String deleteItems = "$server/items/delete.php";
}
