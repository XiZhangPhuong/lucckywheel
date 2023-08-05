import 'package:get/get.dart';
import 'package:luckywheel/screen/anime/anime_controller.dart';

class AnimeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AnimeController());
  }

}