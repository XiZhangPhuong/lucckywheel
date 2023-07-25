import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:luckywheel/screen/match_detail/match_detail_controller.dart';

class MatchDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MatchDetailController());
  }

}