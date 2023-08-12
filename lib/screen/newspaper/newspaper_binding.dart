import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:luckywheel/screen/newspaper/newspaper_controller.dart';

class NewSpaperBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NewSpaperController());
  }

}