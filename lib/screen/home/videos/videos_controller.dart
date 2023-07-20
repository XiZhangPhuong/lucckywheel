import 'package:get/get.dart';

class VideosController extends GetxController {
  String urlVideo = Get.arguments as String;
  @override
  void onInit() {
    super.onInit();
    print(urlVideo);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
