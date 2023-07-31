import 'package:get/get.dart';
import 'package:luckywheel/repository/movie_repository.dart';
import 'package:luckywheel/routes/routes_path/movie_routes.dart';

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
  // get genre
  List<dynamic> listGenre = [];
  bool isLoadingGenre = false;
  int currenIndex = 0;
  @override
  void onInit() {
    super.onInit();
    getAllGenres();
  }

  ///
  /// change tabbar
  ///
  void changeTabBar({required int index}) {
    currenIndex = index;
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
  Future<void> getAnime(String gend) async {
    await _movieRepository.getAllAnime(
      page: 1,
      size: 50,
      genres: gend,
      onSuccess: (resuilt) {
        listAnime = resuilt;
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// getAllGenres
  ///
  Future<void> getAllGenres() async {
    await _movieRepository.getAllGenres(
      onSuccess: (resuilt) {
        listGenre = resuilt;
        getAnime(listGenre.first['_id']);
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }
}
