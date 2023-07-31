import 'package:get/get.dart';
import 'package:luckywheel/screen/blogger/detail_blogger/detail_blogger_controller.dart';

class DetailBloggerBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailBloggerController());
  }
   
}