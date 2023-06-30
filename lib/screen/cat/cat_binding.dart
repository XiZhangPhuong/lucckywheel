import 'package:get/get.dart';
import 'package:luckywheel/screen/cat/cat_controller.dart';

class CatBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CatController());
  }

}