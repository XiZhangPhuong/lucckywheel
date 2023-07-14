import 'package:get/get.dart';
import 'package:luckywheel/screen/home/home_binding.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeBinding());
  }

}