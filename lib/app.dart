import 'package:farm_setu_assignment/configs/app-config.dart';
import 'package:farm_setu_assignment/routes.dart';
import 'package:farm_setu_assignment/shared/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //GET MATERIAL APP FOR SNACKBAR ETC USE
    return GetMaterialApp(
      navigatorKey: appNavigationService.myNavigatorKey,
      title: appConfig.appName ?? "FARM SETU",
      debugShowCheckedModeBanner: appConfig.showDebugBanner,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // themeMode: themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // darkTheme: themeController.themeDark,
      initialRoute: Routes.initial,
      onGenerateRoute: Routes.getGeneratedRoute,
    );
  }
}
