import 'package:admin/view/screens/categories/add.dart';
import 'package:admin/view/screens/categories/edit.dart';
import 'package:admin/view/screens/categories/view.dart';
import 'package:admin/view/screens/items/add.dart';
import 'package:admin/view/screens/items/edit.dart';
import 'package:admin/view/screens/items/view.dart';
import 'package:admin/view/screens/orders/ordersScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/core/middleware/myMiddleware.dart';
import 'package:admin/view/screens/auth/forgetPassword/forget_password.dart';
import 'package:admin/view/screens/auth/login.dart';
import 'package:admin/view/screens/auth/forgetPassword/reset_password.dart';
import 'package:admin/view/screens/auth/forgetPassword/success_resetpassword.dart';
import 'package:admin/view/screens/auth/forgetPassword/verify_code.dart';
import 'package:admin/view/screens/homePage.dart';
import 'package:admin/view/screens/languages.dart';
import 'package:admin/view/screens/orders/archive.dart';
import 'package:admin/view/screens/orders/details.dart';
import 'package:admin/view/screens/orders/pending.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Languages(), middlewares: [MyMiddleware()]),
  GetPage(
    name: AppRoutes.ordersscreen,
    page: () => const OrdersScreen(),
  ),
  GetPage(
    name: AppRoutes.editItems,
    page: () => const EditItems(),
  ),
  GetPage(
    name: AppRoutes.addItems,
    page: () => const AddItems(),
  ),
  GetPage(
    name: AppRoutes.viewItems,
    page: () => const ViewItems(),
  ),
  GetPage(
    name: AppRoutes.editCategories,
    page: () => const EditCategories(),
  ),
  GetPage(
    name: AppRoutes.addCategories,
    page: () => const AddCategories(),
  ),
  GetPage(
    name: AppRoutes.viewCategories,
    page: () => const ViewCategories(),
  ),
  GetPage(
    name: AppRoutes.archiveOrders,
    page: () => const ArchiveOrders(),
  ),
  GetPage(
    name: AppRoutes.ordersDetails,
    page: () => const OrdersDetails(),
  ),
  GetPage(
    name: AppRoutes.pendingOrders,
    page: () => const OrdersPending(),
  ),
  GetPage(
    name: AppRoutes.homepage,
    page: () => const HomePage(),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
 
];
