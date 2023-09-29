import 'package:admin/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/initial_bindings.dart';
import 'core/localization/changeLocale.dart';
import 'core/localization/translations.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      getPages: routes,
      initialBinding:InitialBindings() ,
    );
  }
}
