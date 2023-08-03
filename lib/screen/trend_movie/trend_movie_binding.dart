import 'package:get/get.dart';
import 'package:luckywheel/screen/trend_movie/trend_movie_controller.dart';

class TrendMovieBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TrendMovieController());
  }

}