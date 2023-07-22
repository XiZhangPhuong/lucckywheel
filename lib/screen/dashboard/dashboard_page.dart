import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/screen/dashboard/dashboard_controller.dart';
import 'package:luckywheel/screen/football/football_page.dart';
import 'package:luckywheel/screen/home/home_page.dart';
import 'package:luckywheel/screen/nasa/nasa_page.dart';
import 'package:luckywheel/screen/nation/nation_page.dart';
import 'package:luckywheel/util/color_resources.dart';

class DashBoardPage extends GetView<DashBoardController> {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashBoardController(),
      builder: (DashBoardController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          bottomNavigationBar: _bottomBar(controller),

          body: IndexedStack(
            index: controller.currenIndex,
            children: [
              HomePage(),
              HomePage(),
              HomePage(),
              
            ],
          ),
        );
      },
    );
  }

///
/// bottom bar
///
  Widget _bottomBar(DashBoardController controller) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorResources.WHITE, // Màu sắc của elevation tùy chỉnh
              blurRadius: 8, // Độ mờ của elevation
             // spreadRadius: 2, // Khoảng cách lan rộng của elevation
              offset: Offset(0, 2), // Vị trí offset của elevation
            ),
          ],
        ),
      child: BottomNavigationBar(
            currentIndex: controller.currenIndex,
            onTap: (value) {
              controller.changePage(value);
            },
            selectedItemColor: ColorResources.MAIN,
            unselectedItemColor: Colors.white70,
            selectedLabelStyle: GoogleFonts.nunito(
              
            ),
            unselectedLabelStyle: GoogleFonts.nunito(
    
            ),
            
            selectedFontSize: 14,
            unselectedFontSize: 14,
            backgroundColor: ColorResources.BACKGROUND,
            
            items: [
               BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
              tooltip: 'Home'
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.live_tv),
              label: 'Live',
              tooltip: 'Live'
            ),  
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              tooltip: 'Profile'
            ),  
            ],
            
          ),
    );
  }
}

