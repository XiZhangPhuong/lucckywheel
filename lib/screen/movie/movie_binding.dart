import 'package:get/get.dart';

class MovieBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MovieBinding());
  }

}