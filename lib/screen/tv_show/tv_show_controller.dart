import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/repository/movie_repository.dart';
import 'package:luckywheel/routes/routes_path/tvshow_routes.dart';
import 'package:luckywheel/temp.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TvShowController extends GetxController {
  final MovieRepository _movieRepository = MovieRepository();
  // get trending movie
  List<dynamic> listTV = [];
  bool isLoading = false;
  int page = 1;
  RefreshController refreshController = RefreshController();

    // get all video phim
  List<dynamic> listVideoMovie = [];
  bool isLoadingVideoMovie = false;
  int id = 0;

  @override
  void onInit() {
    super.onInit();
    _getTrendingMovie();
  }

    ///
  /// get all video movie
  ///
  Future<void> getAllVideoMovie({required int id,required String media_type}) async {
    await _movieRepository.getAllVideoMovie(
      id: id,
      media_type: media_type,
      onSuccess: (data) {
        listVideoMovie = data;
        isLoadingVideoMovie = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// go to detail movie
  ///
  void gotoDetailMovie(int id){
    Get.toNamed(TvShowRoutes.DETAIL_ANIME,arguments: id);
  }

  ///
  ///
  ///
  String convertVote(double number) {
    return number.toStringAsFixed(1);
  }

  ///
  /// getTrending Movie
  ///
  Future<void> _getTrendingMovie() async {
    await _movieRepository.getTrendingTVByWeek(
      page: page,
      onSuccess: (data) {
        listTV.addAll(data);
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// onLoading
  ///
  void onLoading() async {
    page++;
    await _getTrendingMovie();
    refreshController.loadComplete();
    update();
  }

  ///
  /// onRefreshing
  ///
  void onReFreshing() async {
    page = 1;
    listTV.clear();
    await _getTrendingMovie();
    refreshController.refreshCompleted();
    update();
  }

   ///
  /// show bottot sheet team football by id
  ///
  Future<void> showBottomSheetMovie(
      {required int id,required BuildContext context,required String media_type}) async {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Đảm bảo dialog không thể đóng khi bấm ra ngoài
      builder: (context) => LoadingIndicator(),
    );
    await getAllVideoMovie(id: id,media_type: media_type);
    Get.back();
    Get.bottomSheet(
      Container(
        height: Get.height * 0.9,
        child: isLoadingVideoMovie == false
            ? LoadingIndicator()
            : listVideoMovie.isNotEmpty
                ? WebView(
                    initialUrl:
                        'https://www.youtube.com/watch?v=${listVideoMovie[Temp.indexMovieTrailer(data: listVideoMovie)]['key']}',
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
