import 'package:get/get.dart';

class DashBoardController extends GetxController{
  int currenIndex  = 2;

  ///
  /// changePage
  ///
  void changePage(int index){
    currenIndex = index;
    update();
  }
}