import 'package:get/get.dart';
import 'package:luckywheel/screen/blogger/detail_blogger/detail_blogger_binding.dart';
import 'package:luckywheel/screen/blogger/detail_blogger/detail_blogger_page.dart';

class BloggerRoutes{
  static const String DETAIL_BLOGGER = '/detail_blogger';
  static List<GetPage> list   =  [
     GetPage(
      name: DETAIL_BLOGGER,
      page: () => const DetailBloggerPage(),
      binding: DetailBloggerBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}