import 'package:get/get.dart';
import 'package:luckywheel/screen/nation/nation_controller.dart';

class NationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NationController());
  }

}