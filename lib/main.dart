import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:luckywheel/routes/app_routes.dart';
import 'package:luckywheel/routes/routes_path/home_routes.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LucKy Wheel',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.list,
      initialRoute: HomeRoutes.HOME,
    );
  }
}