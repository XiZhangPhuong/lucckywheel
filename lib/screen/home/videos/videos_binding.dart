import 'package:get/get.dart';
import 'package:luckywheel/screen/home/videos/videos_controller.dart';

class VideosBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VideosController());
  }

}