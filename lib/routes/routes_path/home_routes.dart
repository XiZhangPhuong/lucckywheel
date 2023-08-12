import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:luckywheel/screen/home/home_binding.dart';
import 'package:luckywheel/screen/product/product_binding.dart';
import 'package:luckywheel/screen/product/product_page.dart';
import 'package:luckywheel/screen/team/team_binding.dart';
import 'package:luckywheel/screen/team/team_page.dart';


import '../../screen/home/home_page.dart';

class HomeRoutes {
  static const String HOME = '/home';
  static const String USER = '/user';
  static const String CAT = '/cat';
  static const String NASA = '/nasa';
  static const String NATION = '/nation';
  static const String TECHPORT = '/techport';
  static const String TECHTRANFER = '/techtranfer';
  static const String NEWSPAPER = '/newspaper';
  static const String FOOTBALL = '/football';
  static const String COMPETITION = '/competition';
  static const String DASHBOARD = '/dashboard';
  static const String VIDEOS = '/videos';
  static const String TEAM = '/team';
  static const String MATCH_DETAIL = '/match_detail';
  static const String PRODUCT = '/product';

  static List<GetPage> list = [
    GetPage(
      name: HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  
    GetPage(
      name: TEAM,
      page: () => const TeamPage(),
      binding: TeamBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
     GetPage(
      name: PRODUCT,
      page: () => const ProductPage(),
      binding: ProductBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),

  ];
}
