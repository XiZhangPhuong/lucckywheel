import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckywheel/repository/movie_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnimeController extends GetxController {
  final MovieRepository _movieRepository = MovieRepository();
  // hentai anime
  bool isLoading = false;
  int page  = 1;
  int size = 18;
  List<dynamic> listAnime  = [];
  RefreshController refreshController  = RefreshController();


  @override
  void onInit() {
    super.onInit();
    _getHentaiAnime();
  }

  ///
  /// get hentai anime
  ///
  Future<void> _getHentaiAnime() async {
    await _movieRepository.getAllAnime(
      page: page,
      size: size,
      onSuccess: (resuilt) {
        listAnime.addAll(resuilt);
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );   
  }

  ///
  /// on Loading
  ///
  void onLoading() async {
    page++;
    await _getHentaiAnime();
    refreshController.loadComplete();
    update();
  }

  ///
  /// on refresh
  ///
  void onRefreshing() async {
    listAnime.clear();
    page = 1;
    await _getHentaiAnime();
    refreshController.refreshCompleted();
    update();
  }

   ///
  /// show bottot sheet team football by id
  ///
  void showBottomSheet({required String url}) {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          color: Colors.white,
        ),
        child: url.isNotEmpty
            ? WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                debuggingEnabled: true,

                // Cho phép cuộn trong WebView
                gestureRecognizers: Set()
                  ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
              )
            : Center(
                child: Text(
                  'No data',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

}
