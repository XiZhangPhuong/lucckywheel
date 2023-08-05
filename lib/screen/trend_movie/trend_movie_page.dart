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
          floatingActionButton: _floatTingButton(controller),
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
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listMovie.length,
                      controller: controller.scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        final item = controller.listMovie[index];
                        return GestureDetector(
                          onTap: () {
                            print(item['id']);
                            controller.showBottomSheetMovie(
                                id: item['id'],
                                context: context,
                                media_type: item['media_type']);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    Temp.imageMovieDB(
                                        url: item['poster_path'])[2],
                                    // height: 300,
                                    width: Get.width / 2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    Validate.nullOrEmpty(item['vote_average'])
                                        ? '0.0'
                                        : Temp.convertVote(
                                            item['vote_average']),
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                Validate.nullOrEmpty(item['title']) &&
                                        Validate.nullOrEmpty(item['name'])
                                    ? 'No name'
                                    : Validate.nullOrEmpty(item['title'])
                                        ? item['name']
                                        : item['title'],
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
        );
      },
    );
  }

   ///
  /// floatingButon
  ///
  Widget _floatTingButton(TrendMovieController controller) {
    return AnimatedOpacity(
      opacity: controller.showFloatingButton.value ? 1.0 : 0.0,
      duration: Duration(microseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          
        ),
        child: FloatingActionButton(
          onPressed: () {
            controller.scrollToTop();
          },
          child: Icon(Icons.arrow_upward,color: Colors.white,),
          mini: true,
          backgroundColor: ColorResources.MAIN.withOpacity(0.7),
        ),
      ),
    );
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
}