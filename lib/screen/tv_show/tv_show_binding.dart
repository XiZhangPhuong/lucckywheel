import 'package:get/get.dart';
import 'package:luckywheel/screen/tv_show/tv_show_controller.dart';

class TvShowBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TvShowController());
  }

}