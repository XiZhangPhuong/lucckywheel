

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                    colors: [Colors.black12, Colors.blue.withOpacity(0.5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // hinh anh thien van
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(HomeRoutes.NASA,
                       
                      );
                      
                      
                    },
                    child: Container(
                      height: maxHight / 15,
                      margin: EdgeInsets.symmetric(horizontal: maxWidght / 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Center(
                        child: Text(
                          'txt_hinhanhthienvan'.tr,
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(HomeRoutes.NATION);
                    },
                    child: Container(
                      height: maxHight / 15,
                      margin: EdgeInsets.symmetric(horizontal: maxWidght / 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Center(
                        child: Text(
                          'txt_thongtinquocgia'.tr,
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // techport
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(HomeRoutes.TECHPORT);
                    },
                    child: Container(
                      height: maxHight / 15,
                      margin: EdgeInsets.symmetric(horizontal: maxWidght / 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Center(
                        child: Text(
                          'txt_congcongnghe'.tr.tr,
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // techTranfer
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(HomeRoutes.TECHTRANFER);
                    },
                    child: Container(
                      height: maxHight / 15,
                      margin: EdgeInsets.symmetric(horizontal: maxWidght / 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Center(
                        child: Text(
                          'txt_bangsangche'.tr,
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // language
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showBottomSheetLanguage(controller);
                    },
                    child: Container(
                      height: maxHight / 15,
                      margin: EdgeInsets.symmetric(horizontal: maxWidght / 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Center(
                        child: Text(
                          'txt_ngonngu'.tr,
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
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

  ///
  /// showBottomSheet Change Language
  ///
  Future<dynamic> _showBottomSheetLanguage(HomeController controller) async {
    await Get.bottomSheet(
      GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          return Container(
        height: Get.height * 0.7,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black12, Colors.black38],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'txt_chonngonngu'.tr,
              style: GoogleFonts.nunito(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
              //  physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    controller.dataList.length, // Số lượng item trong grid
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Số lượng widget trên mỗi hàng ngang
                ),
                itemBuilder: (context, index) {
                  final item = controller
                      .dataList[index]; // Dữ liệu của item tại vị trí index

                  return GestureDetector(
                    onTap: () {
                      controller.changeLanguage(index);
                     //et.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: controller.selectTed == index
                              ? Colors.black
                              : null),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              item['url'].toString(),
                              height: 60,
                              width: 80,
                            ),
                          ), // Hình ảnh từ URL
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            item['title'].toString(),
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ), // Văn bản
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
       ); }),
    );
  }
}
