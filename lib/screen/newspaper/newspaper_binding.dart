import 'package:get/get.dart';
import 'package:luckywheel/screen/newspaper/newspaper_controller.dart';

class NewSpaperBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NewSpaperController());
  }

}