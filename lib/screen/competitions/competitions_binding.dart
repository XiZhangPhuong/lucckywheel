import 'package:get/get.dart';
import 'package:luckywheel/screen/competitions/competitions_controller.dart';

class CompetitionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CompetitionsController());
  }

}