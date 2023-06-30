import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/routes/routes_path/home_routes.dart';
import 'package:luckywheel/screen/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double maxHight = MediaQuery.of(context).size.height;
    double maxWidght = MediaQuery.of(context).size.width;
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return Scaffold(
          backgroundColor: Color(0xff1a1a1a), 
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black12,
                  Colors.blue.withOpacity(0.5)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // hinh anh thien van
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(HomeRoutes.NASA);
                    },
                    child: Container(
                      height: maxHight/15,
                      margin: EdgeInsets.symmetric(horizontal: maxWidght/15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: Colors.black)
                      ),
                      child: Center(
                        child: Text(' Hình ảnh thiên văn',style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                   GestureDetector(
                    onTap: () {
                      Get.toNamed(HomeRoutes.NATION);
                    },
                    child: Container(
                      height: maxHight/15,
                      margin: EdgeInsets.symmetric(horizontal: maxWidght/15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: Colors.black)
                      ),
                      child: Center(
                        child: Text('Thông tin quốc gia',style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
