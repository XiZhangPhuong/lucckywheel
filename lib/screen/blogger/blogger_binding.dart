import 'package:get/get.dart';
import 'package:luckywheel/screen/blogger/blogger_controller.dart';

class BloggerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BloggerController());  
  }

}