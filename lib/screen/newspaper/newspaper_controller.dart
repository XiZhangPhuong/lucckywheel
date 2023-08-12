import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:luckywheel/model/newspaper_response.dart';
import 'package:luckywheel/repository/newspaper_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewSpaperController extends GetxController {
  final NewSpaperRepository _newSpaperRepository = NewSpaperRepository();
  List<RssItem> dataNewSpaper = [];
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    _getDataNewSpaper();
  }

  ///
  /// get data newSpaper
  ///
  Future<void> _getDataNewSpaper() async {
    await _newSpaperRepository.getDataVnPress(
      filter: 'tin-moi-nhat.rss',
      onSuccess: (listData) {
        dataNewSpaper = listData;
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// showbottomsheet
  ///
  void showBottomSheetWeb({required String url}){
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        height: Get.height*0.85,
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          debuggingEnabled: true,
          // Cho phép cuộn trong WebView
                    gestureRecognizers: Set()
                      ..add(Factory<VerticalDragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer())),
        ),
      ),
    );
  }
}
