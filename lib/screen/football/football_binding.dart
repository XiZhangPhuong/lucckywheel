import 'package:get/get.dart';
import 'package:luckywheel/screen/football/football_con%20troller.dart';

class FootBallBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FootBallController());
  }

}