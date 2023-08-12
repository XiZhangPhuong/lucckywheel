import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:luckywheel/screen/product/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }

}