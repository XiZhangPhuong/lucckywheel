import 'package:get/get.dart';
import 'package:luckywheel/screen/user/user_controller.dart';

class UserBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }

}