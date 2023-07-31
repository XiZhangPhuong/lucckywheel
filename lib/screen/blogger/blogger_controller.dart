import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckywheel/repository/blogger_repository.dart';
import 'package:luckywheel/routes/routes_path/blogger_routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BloggerController extends GetxController {
  final BloggerRepository _bloggerRepository = BloggerRepository();
  // get all post
  List<dynamic> listPost = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    _getAllPost();
  }

  ///
  /// go to detail blogger
  ///
  void gotoDetailBlogger({required String id}) {
    Get.toNamed(BloggerRoutes.DETAIL_BLOGGER, arguments: id);
  }

  ///
  /// getAllPost
  ///
  Future<void> _getAllPost() async {
    await _bloggerRepository.getAllPost(
      onSuccess: (resuilt) {
        listPost = resuilt;
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// show bottom sheet
  ///
  void showBottomSheet({required dynamic item}) {
    Get.bottomSheet(
      isScrollControlled: false,
      useRootNavigator: true,   
      Container(
        height: Get.height*0.8,
      child: WebView(
        initialUrl: 'data:text/html;charset=utf-8,' +
            Uri.encodeComponent(item['content']),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ));
  }
}
