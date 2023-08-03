import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:luckywheel/screen/movie/detail_anime/detail_anime_binding.dart';
import 'package:luckywheel/screen/movie/detail_anime/detail_anime_page.dart';

class TvShowRoutes{
   static const String DETAIL_ANIME = '/detail_anime';
  static List<GetPage> list   =  [
     GetPage(
      name: DETAIL_ANIME,
      page: () => const DetailAnimePage(),
      binding: DetaiAnimeBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}