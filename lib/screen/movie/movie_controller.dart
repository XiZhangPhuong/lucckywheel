import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckywheel/repository/movie_repository.dart';
import 'package:luckywheel/routes/routes_path/movie_routes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MovieController extends GetxController {
  List<String> listImage = [
    'https://www.vietnamfineart.com.vn/wp-content/uploads/2023/03/top-10-phim-dien-anh-anime-hay-va-cam-dong-nhat_623808908c665-5.jpeg',
    'https://simg.zalopay.com.vn/zlp-website/assets/Thumb_phim_anime_hay_653dbb8e87.jpg',
    'https://cdn.popsww.com/blog/sites/2/2021/07/phim-hoat-hinh-nhat-ban.jpg',
    'https://cdn.popsww.com/blog/sites/2/2021/10/nhung-bo-phim-hoat-hinh-hay-nhat-cua-nhat-ban.jpg',
    'https://shizen.edu.vn/wp-content/uploads/2020/11/Anime-Phim-ho%E1%BA%A1t-h%C3%ACnh-Nh%E1%BA%ADt-B%E1%BA%A3n.jpg',
  ];
  final MovieRepository _movieRepository = MovieRepository();
  // get anime
  List<dynamic> listAnime = [];
  bool isLoading = false;
  int page  = 1;
  int size = 12;
  RefreshController scrollController = RefreshController();
  // get genre
  List<dynamic> listGenre = [];
  bool isLoadingGenre = false;
  int currenIndex = 0;
  @override
  void onInit() {
    super.onInit();
    getAllGenres();
  }

    @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  ///
  /// change tabbar
  ///
  Future<void> changeTabBar({required int index,required String gend}) async {
    currenIndex = index;
    await getAnime();
    update();
  }

  ///
  /// go to detail anime
  ///
  void gotoDetailAnime({required sentData}){
    Get.toNamed(MovieRoutes.DETAIL_ANIME,arguments: sentData);
  }
  
 
  ///
  /// get anime
  ///
  Future<void> getAnime() async {
    await _movieRepository.getAllAnime(
      page: page,
      size: size,
      onSuccess: (resuilt) {
        listAnime.addAll(resuilt);
        print("Số lượng Anime = ${listAnime.length}");
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// on Loading
  ///
 void onLoading() async{
  await Future.delayed(Duration(seconds: 1));
   page++;
   await getAnime();
   scrollController.loadComplete();
   update();
 }

///
/// on refresh
///
void onRefreshing() async{
  listAnime.clear();
  size = 12;
  await getAnime();
  scrollController.refreshCompleted();
  update();
}

  ///
  /// getAllGenres
  ///
  Future<void> getAllGenres() async {
    await _movieRepository.getAllGenres(
      onSuccess: (resuilt) {
        listGenre = resuilt;
        listGenre.shuffle();
        getAnime();
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }
}
