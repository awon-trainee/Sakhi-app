
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakhi_app/core/locale/locale_string.dart';


import 'core/route/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await GetStorage.init();
  runApp(const MyApp());
}


final box = GetStorage();
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: LocaleString(),
        locale: getLang() != null && getCode() != null
            ? Locale(getLang()!, getCode())
            : const Locale('ar', 'SA'),
        title: 'Sakhi App',
        debugShowCheckedModeBanner: false,
        getPages: AppUserRoutes.routes,
        initialRoute: UserRoutes.splashView

    );
  }
}
String? getLang() {
  final box = GetStorage();

  return box.read('lang');
}
String? getCode() {
  final box = GetStorage();
  return box.read('code');
}
