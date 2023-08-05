import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/gridview_movie.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/movie/detail_anime/detail_anime_controller.dart';
import 'package:luckywheel/temp.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class DetailAnimePage extends GetView<DetailAnimeController> {
  const DetailAnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DetailAnimeController(),
      builder: (DetailAnimeController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          body: controller.isLoadingMovie == false
              ? LoadingIndicator()
              : _bodyDetailMovie(controller)
        );
      },
    );
  }

///
///
///
  Container _bodyDetailMovie(DetailAnimeController controller) {
    return Container(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            Temp.imageMovieDB(url: controller.dataMovie['backdrop_path']).last,
                            fit: BoxFit.cover,
                          ),
                          // icon back
                          Positioned(
                            top: 30,
                            left: 15,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                padding: EdgeInsets.all(7.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // ico play video trailer
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () {
                                controller.showBottomSheet(
                                    listData: controller.listVideo);
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                Validate.nullOrEmpty(
                                        controller.dataMovie['title'])
                                    ? controller.dataMovie['name']
                                    : controller.dataMovie['title'],
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // dah muc phim
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 30,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listGenres.length,
                          itemBuilder: (context, index) {
                            final item = controller.listGenres[index];
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey,
                              ),
                              child: Center(
                                child: Text(
                                  item['name'],
                                  style: GoogleFonts.nunito(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          controller.dataMovie['overview'],
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Top Billed Cast',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listPoforMer.length,
                          itemBuilder: (context, index) {
                            final item = controller.listPoforMer[index];
                            return GestureDetector(
                              onTap: () {
                                print(item['id']);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: Validate.nullOrEmpty(
                                            item['profile_path'])
                                        ? 0
                                        : 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Validate.nullOrEmpty(
                                        item['profile_path'])
                                    ? null
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                              child: Image.network(
                                                Temp.imageMovieDB(
                                                        url: item[
                                                            'profile_path'])
                                                    .last,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            Validate.nullOrEmpty(item['name'])
                                                ? ''
                                                : item['name'],
                                            style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Similar Movie',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                     GridViewMovie(
                      listData: controller.listSimilar,
                      routes: '',
                     )
                    ],
                  ),
                ),
              );
  }

  ///
  ///
  ///
  SingleChildScrollView _bodyCUstom(DetailAnimeController controller) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: Get.height / 2.5,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/original${controller.dataMovie['backdrop_path']}',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          width: Get.width / 1.65,
                          color: ColorResources.BACKGROUND,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Validate.nullOrEmpty(
                                        controller.dataMovie['title'])
                                    ? controller.dataMovie['name']
                                    : 'Đang cập nhập',
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: controller.listGenres
                                    .map(
                                      (e) => Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.grey,
                                        ),
                                        child: Text(
                                          e['name'],
                                          style: GoogleFonts.nunito(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    left: 10,
                    top: 110,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        Temp.imageMovieDB(
                            url: controller.dataMovie['poster_path'])[2],
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // thong tin phim
            Divider(
              color: Colors.white.withOpacity(0.5),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                controller.dataMovie['overview'],
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),

            Divider(
              color: Colors.white.withOpacity(0.5),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.all(10.0),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.listSeason.length,
                itemBuilder: (context, index) {
                  final item = controller.listSeason[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          Validate.nullOrEmpty(item['poster_path'])
                              ? ''
                              : Temp.imageMovieDB(url: item['poster_path'])[2],
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.5),
            ),
            // danh sách diễn viên của phim
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
