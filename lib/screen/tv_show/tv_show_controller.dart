import 'package:get/get.dart';
import 'package:luckywheel/repository/movie_repository.dart';
import 'package:luckywheel/routes/routes_path/tvshow_routes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TvShowController extends GetxController {
  final MovieRepository _movieRepository = MovieRepository();
  // get trending movie
  List<dynamic> listTV = [];
  bool isLoading = false;
  int page = 1;
  RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    _getTrendingMovie();
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
}
