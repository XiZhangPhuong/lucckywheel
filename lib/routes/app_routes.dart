import 'package:get/get_navigation/get_navigation.dart';
import 'package:luckywheel/routes/routes_path/blogger_routes.dart';
import 'package:luckywheel/routes/routes_path/home_routes.dart';
import 'package:luckywheel/routes/routes_path/movie_routes.dart';

class AppPages{
    static List<GetPage> list = [
      ...HomeRoutes.list,
      ... BloggerRoutes.list,
      ...MovieRoutes.list,
    ];
}