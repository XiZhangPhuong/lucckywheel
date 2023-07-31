import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:luckywheel/screen/movie/detail_anime/detail_anime_controller.dart';

class DetaiAnimeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailAnimeController());
  }

}