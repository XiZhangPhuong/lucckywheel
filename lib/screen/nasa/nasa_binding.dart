import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:luckywheel/screen/nasa/nasa_controller.dart';

class NasaBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NasaController());
  }

}