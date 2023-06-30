import 'package:get/get.dart';
import 'package:luckywheel/screen/nation/infor_nation/infor_nation_controller.dart';

class InforNationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => InforNationController());
  }

}