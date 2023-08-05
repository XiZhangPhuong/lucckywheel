import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:luckywheel/screen/anime/anime_binding.dart';
import 'package:luckywheel/screen/anime/anime_page.dart';
import 'package:luckywheel/screen/movie/detail_anime/detail_anime_binding.dart';
import 'package:luckywheel/screen/movie/detail_anime/detail_anime_page.dart';

class MovieRoutes{
   static const String DETAIL_ANIME = '/detail_anime';
   static const String VIEW_ALL_MOVIE = '/view_all_movie';
   static const String ANIME  = '/anime';
  static List<GetPage> list   =  [
     GetPage(
      name: DETAIL_ANIME,
      page: () => const DetailAnimePage(),
      binding: DetaiAnimeBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),

     GetPage(
      name: ANIME,
      page: () => const AnimePage(),
      binding: AnimeBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),

   
  ];
}