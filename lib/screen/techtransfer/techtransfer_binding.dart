import 'package:get/get.dart';
import 'package:luckywheel/screen/techtransfer/techtransfer_controller.dart';

class techTransFerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => techTransFerController());
  }

}

