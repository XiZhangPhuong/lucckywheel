import 'package:get/get.dart';

class ServiceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceBinding());
  ;}

}