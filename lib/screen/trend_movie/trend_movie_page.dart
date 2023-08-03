import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/gridview_movie.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/routes/routes_path/trend_movie_routes.dart';
import 'package:luckywheel/screen/trend_movie/trend_movie_controller.dart';
import 'package:luckywheel/temp.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TrendMoviePage extends GetView<TrendMovieController> {
  const TrendMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TrendMovieController(),
      builder: (TrendMovieController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          appBar: _appBar(),
          body: controller.isLoading == false
              ? LoadingIndicator()
              : Container(
                  padding: EdgeInsets.all(10.0),
                  child: SmartRefresher(
                    controller: controller.refreshController,
                    onLoading: () {
                      controller.onLoading();
                    },
                    onRefresh: () {
                      controller.onReFreshing();
                    },
                    enablePullDown: true,
                    enablePullUp: true,
                    child: GridViewMovie(
                      listData: controller.listMovie,
                      routes: TrendMovieRoutes.DETAIL_ANIME,
                    )
                  ),
                ),
        );
      },
    );
  }
}

///
/// appBar
///
AppBar _appBar() {
  return AppBar(
    backgroundColor: ColorResources.BACKGROUND,
    title: Text(
      'Movie Trending',
      style: GoogleFonts.nunito(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.notifications_outlined,
          color: Colors.white,
        ),
      ),
    ],
  );
}
