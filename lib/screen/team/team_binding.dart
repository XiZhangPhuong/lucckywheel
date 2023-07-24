import 'package:get/get.dart';
import 'package:luckywheel/screen/team/team_controller.dart';

class TeamBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TeamController());
  }

}