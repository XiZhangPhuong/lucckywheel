import 'package:get/get.dart';
import 'package:luckywheel/screen/techport/techport_controller.dart';

class TechPortBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TechPortController());
  }

}