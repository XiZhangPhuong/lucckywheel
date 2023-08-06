import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/listviewMovie.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/routes/routes_path/movie_routes.dart';
import 'package:luckywheel/screen/movie/movie_controller.dart';
import 'package:luckywheel/temp.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MoviePage extends GetView<MovieController> {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MovieController(),
      builder: (MovieController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          appBar: _appBar(),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _slideImage(controller),
                  _mathFootBall(controller),

                  // phim phổ biến
                  //  _popuLarMovie(controller),
                  SizedBox(
                    height: 15,
                  ),

                  // đánh giá cao
                  _topRatedMovie(controller),

                  SizedBox(
                    height: 15,
                  ),

                  // schedule word cup
                  _scheduleWordCup(controller),
                  SizedBox(
                    height: 15,
                  ),

                  // đang phát
                  _upCommingMovie(controller),
                  SizedBox(
                    height: 15,
                  ),
                  // team premier year
                  _teamPremierYer(controller),

                  SizedBox(
                    height: 15,
                  ),

                  // Hentai Anime
                  _hentaiAnime(controller),
                  SizedBox(
                    height: 15,
                  ),

                  // schedule UEFA
                  _scheduleUEFA(controller),
                  SizedBox(
                    height: 15,
                  ),

                  // airning today tv
                  _AirNingToDayTV(controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ///
  /// UEFA Champions League
  ///
  Widget _scheduleUEFA(MovieController controller) {
    return controller.isLoadingUEFA == false
        ? Container()
        : Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${controller.dataUEFA['competition']['name']} ${controller.dataUEFA['filters']['season']}',
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 10),
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.dataUEFA['resultSet']['count'],
                    itemBuilder: (context, index) {
                      final item = controller.dataUEFA['matches'][index];
                      return GestureDetector(
                        onTap: () {
                          print(item['id']);
                        },
                        child: Container(
                          padding: EdgeInsets.all(7.0),
                          margin: EdgeInsets.only(right: 10),
                          width: Get.width * 0.8,
                          // height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            border: Border.all(width: 1, color: Colors.white38),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Thêm này để căn giữa các widget trong cột
                            children: [
                              //
                              Row(
                                children: [
                                  Icon(
                                    Icons.timelapse,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    Validate.nullOrEmpty(item['utcDate'])
                                        ? ''
                                        : Temp.convertUtcToVietnamTime(
                                            item['utcDate']),
                                    style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Spacer(),
                                  Text(
                                    Validate.nullOrEmpty(item['group'])
                                        ? item['stage']
                                        : item['group'],
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                    //  overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                              //
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Validate.nullOrEmpty(
                                                  item['homeTeam']['crest'])
                                              ? Container(
                                                  height: 50,
                                                  width: 50,
                                                )
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  child: item['homeTeam']
                                                              ['crest']
                                                          .toString()
                                                          .endsWith('.png')
                                                      ? Image.network(
                                                          item['homeTeam']
                                                              ['crest'],
                                                          height: 50,
                                                          width: 50,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : SvgPicture.network(
                                                          item['homeTeam']
                                                              ['crest'],
                                                          height: 50,
                                                          width: 50,
                                                          fit: BoxFit.cover,
                                                        ),
                                                ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            Validate.nullOrEmpty(
                                                    item['homeTeam']
                                                        ['shortName'])
                                                ? 'No name'
                                                : item['homeTeam']['shortName'],
                                            style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              Validate.nullOrEmpty(item['score']
                                                      ['fullTime']['home'])
                                                  ? '-  -'
                                                  : '${item['score']['fullTime']['home'].toString()} - ${item['score']['fullTime']['away']}',
                                              style: GoogleFonts.nunito(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Validate.nullOrEmpty(
                                                    item['score']['penalties'])
                                                ? Text(
                                                    'HT : '
                                                    '${item['score']['halfTime']['home'].toString()} - ${item['score']['halfTime']['away']}',
                                                    style: GoogleFonts.nunito(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                  )
                                                : Text(
                                                    'Pen : '
                                                    '${item['score']['penalties']['home'].toString()} - ${item['score']['penalties']['away']}',
                                                    style: GoogleFonts.nunito(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Validate.nullOrEmpty(
                                                  item['awayTeam']['crest'])
                                              ? Container(
                                                  height: 50,
                                                  width: 50,
                                                )
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                  child: item['awayTeam']
                                                              ['crest']
                                                          .toString()
                                                          .endsWith('.png')
                                                      ? Image.network(
                                                          item['awayTeam']
                                                              ['crest'],
                                                          height: 50,
                                                          width: 50,
                                                        )
                                                      : SvgPicture.network(
                                                          item['awayTeam']
                                                              ['crest'],
                                                          height: 50,
                                                          width: 50,
                                                        ),
                                                ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            Validate.nullOrEmpty(
                                                    item['awayTeam']
                                                        ['shortName'])
                                                ? 'No name'
                                                : item['awayTeam']['shortName'],
                                            style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
  }

  ///
  /// schedule Word cup
  ///
  Widget _scheduleWordCup(MovieController controller) {
    return controller.isLoadingDataWordCup == false
        ? Container()
        : Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${controller.dataWordCup['competition']['name']} ${controller.dataWordCup['filters']['season']}',
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 10),
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.dataWordCup['resultSet']['count'],
                    itemBuilder: (context, index) {
                      final item = controller.dataWordCup['matches'][index];
                      return GestureDetector(
                        onTap: () {
                          print(item['id']);
                          controller.showBottomSheetFootBall(idMatch: item['id'], item: item, context: context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(7.0),
                          margin: EdgeInsets.only(right: 10),
                          width: Get.width * 0.8,
                          // height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            border: Border.all(width: 1, color: Colors.white38),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Thêm này để căn giữa các widget trong cột
                            children: [
                              //
                              Row(
                                children: [
                                  Icon(
                                    Icons.timelapse,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    Validate.nullOrEmpty(item['utcDate'])
                                        ? ''
                                        : Temp.convertUtcToVietnamTime(
                                            item['utcDate']),
                                    style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Spacer(),
                                  Text(
                                    Validate.nullOrEmpty(item['group'])
                                        ? item['stage']
                                        : item['group'],
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              //
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Validate.nullOrEmpty(
                                                  item['homeTeam']['crest'])
                                              ? Container(
                                                  height: 50,
                                                  width: 50,
                                                )
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  child: item['homeTeam']
                                                              ['crest']
                                                          .toString()
                                                          .endsWith('.png')
                                                      ? Image.network(
                                                          item['homeTeam']
                                                              ['crest'],
                                                          height: 50,
                                                          width: 50,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : SvgPicture.network(
                                                          item['homeTeam']
                                                              ['crest'],
                                                          height: 50,
                                                          width: 50,
                                                          fit: BoxFit.cover,
                                                        ),
                                                ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            Validate.nullOrEmpty(
                                                    item['homeTeam']
                                                        ['shortName'])
                                                ? 'No name'
                                                : item['homeTeam']['shortName'],
                                            style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              Validate.nullOrEmpty(item['score']
                                                      ['fullTime']['home'])
                                                  ? '-  -'
                                                  : '${item['score']['fullTime']['home'].toString()} - ${item['score']['fullTime']['away']}',
                                              style: GoogleFonts.nunito(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Validate.nullOrEmpty(
                                                    item['score']['penalties'])
                                                ? Text(
                                                    'HT : '
                                                    '${item['score']['halfTime']['home'].toString()} - ${item['score']['halfTime']['away']}',
                                                    style: GoogleFonts.nunito(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                  )
                                                : Text(
                                                    'Pen : '
                                                    '${item['score']['penalties']['home'].toString()} - ${item['score']['penalties']['away']}',
                                                    style: GoogleFonts.nunito(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Validate.nullOrEmpty(
                                                  item['awayTeam']['crest'])
                                              ? Container(
                                                  height: 50,
                                                  width: 50,
                                                )
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                  child: item['awayTeam']
                                                              ['crest']
                                                          .toString()
                                                          .endsWith('.png')
                                                      ? Image.network(
                                                          item['awayTeam']
                                                              ['crest'],
                                                          height: 50,
                                                          width: 50,
                                                        )
                                                      : SvgPicture.network(
                                                          item['awayTeam']
                                                              ['crest'],
                                                          height: 50,
                                                          width: 50,
                                                        ),
                                                ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            Validate.nullOrEmpty(
                                                    item['awayTeam']
                                                        ['shortName'])
                                                ? 'No name'
                                                : item['awayTeam']['shortName'],
                                            style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
  }

  ///
  /// teamPremier
  ///
  Widget _teamPremierYer(MovieController controller) {
    return controller.isLoadingTeamFootball == false
        ? Container()
        : Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Premier League ${DateTime.now().year}',
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listTeamFootball.length,
                  itemBuilder: (context, index) {
                    final item = controller.listTeamFootball[index];
                    return GestureDetector(
                      onTap: () {
                        print(item['id']);
                        controller.showBottomSheetAnime(url: item['website']);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(width: 1, color: Colors.white24),
                        ),
                        width: Get.width * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Validate.nullOrEmpty(item['crest'])
                                ? Container()
                                : item['crest'].toString().endsWith('.svg')
                                    ? SvgPicture.network(
                                        item['crest'],
                                        height: 50,
                                        width: 50,
                                      )
                                    : Image.network(
                                        item['crest'],
                                        height: 50,
                                        width: 50,
                                      ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              Validate.nullOrEmpty(item['shortName'])
                                  ? ''
                                  : item['shortName'],
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }

  ///
  /// hentai Anime
  ///
  Widget _hentaiAnime(MovieController controller) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Anime',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.gotoHentaiAnime();
                },
                icon: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          padding: EdgeInsets.only(left: 10),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.listAnime.length,
            itemBuilder: (context, index) {
              final item = controller.listAnime[index];
              return GestureDetector(
                onTap: () {
                  controller.showBottomSheetAnime(url: item['link']);
                },
                child: Container(
                  width: 100,
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Validate.nullOrEmpty(item['image'])
                              ? Container()
                              : Image.network(
                                  item['image'],
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Validate.nullOrEmpty(item['title'])
                            ? 'No name'
                            : item['title'].toString(),
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ///
  /// mathch Football
  ///
  Widget _mathFootBall(MovieController controller) {
    return controller.listMatches.isEmpty
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  'Mathch Football',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: 150,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 10),
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listMatches.length,
                    itemBuilder: (context, index) {
                      final item = controller.listMatches[index];
                      return GestureDetector(
                        onTap: () {
                          print(item['id']);
                          controller.showBottomSheetFootBall(idMatch: item['id'], item: item, context: context);
                        },
                        child:
                         Container(
                          padding: EdgeInsets.all(7.0),
                          margin: EdgeInsets.only(right: 10),
                          width: Get.width * 0.8,
                          // height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            border: Border.all(width: 1, color: Colors.white38),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Thêm này để căn giữa các widget trong cột
                            children: [
                              //
                              Row(
                                children: [
                                  Validate.nullOrEmpty(
                                          item['competition']['emblem'])
                                      ? Container()
                                      : item['competition']['emblem']
                                              .toString()
                                              .endsWith('.png')
                                          ? Image.network(
                                              item['competition']['emblem'],
                                              height: 30,
                                              width: 30,
                                            )
                                          : SvgPicture.network(
                                              item['competition']['emblem'],
                                              height: 30,
                                              width: 30,
                                            ),
                                  SizedBox(width: 5),
                                  Text(
                                    Validate.nullOrEmpty(
                                            item['competition']['name'])
                                        ? 'No name'
                                        : item['competition']['name'],
                                    style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                              //
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Validate.nullOrEmpty(
                                                  item['homeTeam']['crest'])
                                              ? Container(
                                                  height: 50,
                                                  width: 50,
                                                )
                                              : item['homeTeam']['crest']
                                                      .toString()
                                                      .endsWith('.png')
                                                  ? Image.network(
                                                      item['homeTeam']['crest'],
                                                      height: 50,
                                                      width: 50,
                                                    )
                                                  : SvgPicture.network(
                                                      item['homeTeam']['crest'],
                                                      height: 50,
                                                      width: 50,
                                                    ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            Validate.nullOrEmpty(
                                                    item['homeTeam']
                                                        ['shortName'])
                                                ? 'No name'
                                                : item['homeTeam']['shortName'],
                                            style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          Validate.nullOrEmpty(item['score']
                                                  ['fullTime']['home'])
                                              ? '-  -'
                                              : '${item['score']['fullTime']['home'].toString()} - ${item['score']['fullTime']['away']}',
                                          style: GoogleFonts.nunito(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Validate.nullOrEmpty(
                                                  item['awayTeam']['crest'])
                                              ? Container(
                                                  height: 50,
                                                  width: 50,
                                                )
                                              : item['awayTeam']['crest']
                                                      .toString()
                                                      .endsWith('.png')
                                                  ? Image.network(
                                                      item['awayTeam']['crest'],
                                                      height: 50,
                                                      width: 50,
                                                    )
                                                  : SvgPicture.network(
                                                      item['awayTeam']['crest'],
                                                      height: 50,
                                                      width: 50,
                                                    ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            Validate.nullOrEmpty(
                                                    item['awayTeam']
                                                        ['shortName'])
                                                ? 'No name'
                                                : item['awayTeam']['shortName'],
                                            style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                     
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
  }

  ///
  /// upComming Movie
  ///
  Widget _upCommingMovie(MovieController controller) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcomming Movie',
              style: GoogleFonts.nunito(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.listNowPlayingMovie.length,
            itemBuilder: (context, index) {
              final item = controller.listNowPlayingMovie[index];
              return GestureDetector(
                onTap: () {
                  print(item['id']);
                  controller.showBottomSheetMovie(
                      id: item['id'],
                      context: context,
                      media_type: Validate.nullOrEmpty(item['media_type'])
                          ? 'movie'
                          : item['media_type']);
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Validate.nullOrEmpty(item['poster_path'])
                              ? Container()
                              : Image.network(
                                  Temp.imageMovieDB(url: item['poster_path'])
                                      .last,
                                  fit: BoxFit.cover,
                                  width: 150,
                                  // height: 100,
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
                                : Temp.convertVote(item['vote_average']),
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }

  ///
  /// upComming Movie
  ///
  Widget _AirNingToDayTV(MovieController controller) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Airning Today TV',
              style: GoogleFonts.nunito(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.listAriningToday.length,
            itemBuilder: (context, index) {
              final item = controller.listAriningToday[index];
              return GestureDetector(
                onTap: () {
                  print(item['id']);
                  controller.showBottomSheetMovie(
                      id: item['id'],
                      context: context,
                      media_type: Validate.nullOrEmpty(item['media_type'])
                          ? 'movie'
                          : item['media_type']);
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Validate.nullOrEmpty(item['poster_path'])
                              ? Container()
                              : Image.network(
                                  Temp.imageMovieDB(url: item['poster_path'])
                                      .last,
                                  fit: BoxFit.cover,
                                  width: 150,
                                  // height: 100,
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
                                : Temp.convertVote(item['vote_average']),
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }

  ///
  /// top rated movie
  ///
  Widget _topRatedMovie(MovieController controller) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Rated Movie',
              style: GoogleFonts.nunito(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.listTopRatedMovie.length,
            itemBuilder: (context, index) {
              final item = controller.listTopRatedMovie[index];
              return GestureDetector(
                onTap: () {
                  print(item['id']);
                  controller.showBottomSheetMovie(
                      id: item['id'],
                      context: context,
                      media_type: Validate.nullOrEmpty(item['media_type'])
                          ? 'movie'
                          : item['media_type']);
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Validate.nullOrEmpty(item['poster_path'])
                              ? Container()
                              : Image.network(
                                  Temp.imageMovieDB(url: item['poster_path'])
                                      .last,
                                  fit: BoxFit.cover,
                                  width: 150,
                                  // height: 100,
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
                                : Temp.convertVote(item['vote_average']),
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }

  ///
  /// popular Movie
  ///
  Widget _popuLarMovie(MovieController controller) {
    return PhuongListViewMovie(
      listData: controller.listPopuLarMovie,
      pageClickAll: '',
      titleListView: 'Popular Movie',
      pageItem: '',
      valuePageClickAll: ['Popular Movie', 'popular'],
    );
  }

  ///
  /// body movie db
  ///

  ///
  /// body AniMe
  ///
  Expanded _bodyAnime(MovieController controller) {
    return Expanded(
      child: SmartRefresher(
        controller: controller.scrollController,
        enablePullDown: true,
        enablePullUp: true,
        onLoading: () {
          controller.onLoading();
        },
        onRefresh: () {
          controller.onRefreshing();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: controller.listAnime.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                final item = controller.listAnime[index];
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7.0),
                          child: Image.network(
                            Validate.nullOrEmpty(item['image'])
                                ? ''
                                : item['image'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Validate.nullOrEmpty(item['title'])
                            ? ''
                            : item['title'],
                        overflow: TextOverflow.ellipsis,
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
      ),
    );
  }

  ///
  /// tabbar
  ///
  Widget _tabBar(MovieController controller) {
    return Container(
      height: 55,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.listGenre.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.changeTabBar(
                  index: index, gend: controller.listGenre[index]['_id']);
              print(controller.listGenre[index]['_id']);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              margin: EdgeInsets.only(
                right: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: controller.currenIndex == index
                    ? ColorResources.MAIN
                    : ColorResources.BACKGROUND,
                border: controller.currenIndex == index
                    ? null
                    : Border.all(width: 1, color: ColorResources.MAIN),
              ),
              child: Center(
                child: Text(
                  controller.listGenre[index]['_id'],
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: controller.currenIndex == index
                        ? FontWeight.w600
                        : null,
                    color: controller.currenIndex == index
                        ? Colors.white
                        : ColorResources.MAIN,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  ///
  ///
  Container _listViewAnime(MovieController controller) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.listGenre.length,
        itemBuilder: (context, index1) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.listGenre[index1]['_id'],
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: controller.listAnime.length,
                  itemBuilder: (context, index) {
                    final item = controller.listAnime[index];
                    return GestureDetector(
                      onTap: () {
                        print(item['_id']);
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.only(
                          right: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(7.0),
                              child: Image.network(
                                Validate.nullOrEmpty(item['image'])
                                    ? ''
                                    : item['image'],
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              Validate.nullOrEmpty(item['title'])
                                  ? ''
                                  : item['title'],
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }

  ///
  /// item ListView
  ///
  Widget _itemListView(MovieController controller) {
    return Container(
      height: 300,
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.listAnime.length,
        itemBuilder: (context, index) {
          final item = controller.listAnime[index];
          return GestureDetector(
            onTap: () {
              print(item['_id']);
            },
            child: Container(
              width: 200,
              margin: EdgeInsets.only(
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7.0),
                    child: Image.network(
                      Validate.nullOrEmpty(item['image']) ? '' : item['image'],
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    Validate.nullOrEmpty(item['title']) ? '' : item['title'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  /// slide iamge
  ///
  Widget _slideImage(MovieController controller) {
    return CarouselSlider(
      items: controller.listImage.map((e) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image.network(
              e,
              height: 200,
              width: Get.width,
              fit: BoxFit.cover,
            ));
      }).toList(),
      options: CarouselOptions(
        aspectRatio: 2,
        autoPlay: true,
        enlargeCenterPage: true,
        disableCenter: true,
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
        'Home',
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
