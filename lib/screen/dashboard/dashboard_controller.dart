import 'package:get/get.dart';

class DashBoardController extends GetxController{
  int currenIndex  = 0;

  ///
  /// changePage
  ///
  void changePage(int index){
    currenIndex = index;
    update();
  }
}