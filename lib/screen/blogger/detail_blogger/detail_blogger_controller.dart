import 'package:get/get.dart';
import 'package:luckywheel/repository/blogger_repository.dart';

class DetailBloggerController extends GetxController {
  final BloggerRepository _bloggerRepository = BloggerRepository();
  dynamic detailPost = null;
  bool isLoading = false;
  String id = Get.arguments as String;
  @override
  void onInit() {
    super.onInit();
    getDetailPost();
  }

  ///
  /// get detail post
  ///
  Future<void> getDetailPost() async {
    await _bloggerRepository.detailPost(
      id: id,
      onSuccess: (resuilt) {
         detailPost = resuilt;
         isLoading = true;
         update();
      },
      onError: (e) {
         print(e);
      },
    );
  }
}
