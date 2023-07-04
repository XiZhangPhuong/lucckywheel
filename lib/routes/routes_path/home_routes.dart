import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:luckywheel/screen/cat/cat_binding.dart';
import 'package:luckywheel/screen/cat/cat_page.dart';
import 'package:luckywheel/screen/home/home_binding.dart';
import 'package:luckywheel/screen/nasa/nasa_binding.dart';
import 'package:luckywheel/screen/nasa/nasa_page.dart';
import 'package:luckywheel/screen/nation/nation_binding.dart';
import 'package:luckywheel/screen/nation/nation_page.dart';
import 'package:luckywheel/screen/techport/techport_page.dart';
import 'package:luckywheel/screen/techtransfer/techtransfer_binding.dart';
import 'package:luckywheel/screen/techtransfer/techtransfer_page.dart';
import 'package:luckywheel/screen/user/user_binding.dart';
import 'package:luckywheel/screen/user/user_page.dart';

import '../../screen/home/home_page.dart';

class HomeRoutes {
  static const String HOME = '/home';
  static const String USER = '/user';
  static const String CAT = '/cat';
  static const String NASA = '/nasa';
  static const String NATION = '/nation';
  static const String TECHPORT = '/techport';
   static const String TECHTRANFER = '/techtranfer';
  static List<GetPage> list = [
    GetPage(
      name: HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: USER,
      page: () => const UserPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: CAT,
      page: () => const CatPage(),
      binding: CatBinding(),
    ),
    GetPage(
      name: NASA,
      page: () => const NasaPage(),
      binding: NasaBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: NATION,
      page: () => const NationPage(),
      binding: NationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
     GetPage(
      name: TECHPORT,
      page: () => const TechPortPage(),
      binding: NationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
     GetPage(
      name: TECHTRANFER,
      page: () => const TecchTransFerPage(),
      binding: techTransFerBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
