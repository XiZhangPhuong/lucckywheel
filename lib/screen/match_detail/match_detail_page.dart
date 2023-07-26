import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/match_detail/match_detail_controller.dart';
import 'package:luckywheel/temp.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:video_player/video_player.dart';

class MatchDetailpage extends GetView<MatchDetailController> {
  const MatchDetailpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MatchDetailController(),
      builder: (MatchDetailController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          appBar: controller.isLoading == false ? null : _appBar(controller),
          body: controller.isLoading == false
              ? LoadingIndicator()
              : _bodyMatchDetail(controller),
        );
      },
    );
  }

  ///
  /// body match detailt
  ///
  Widget _bodyMatchDetail(MatchDetailController controller) {
    return Column(
      children: [
        // test ADS
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 1,
              color: Colors.white70.withOpacity(0.5),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Temp.processImage1(
                      imageUrl: Validate.nullOrEmpty(
                              controller.matchDetailResponse.homeTeam!.crest!)
                          ? ''
                          : controller.matchDetailResponse.homeTeam!.crest!,
                      height: 70,
                      widght: 70,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      Validate.nullOrEmpty(controller
                              .matchDetailResponse.homeTeam!.shortName)
                          ? ''
                          : controller.matchDetailResponse.homeTeam!.shortName!,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Validate.nullOrEmpty(
                              controller.matchDetailResponse.utcDate)
                          ? ''
                          : controller.matchDetailResponse.status == 'FINISHED'
                              ? 'Đã hoàn thành'
                              : Temp.convertUtcToVietnamTime(
                                  controller.matchDetailResponse.utcDate!,
                                ),
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    controller.matchDetailResponse.status == "FINISHED"
                        ? Text(
                            '${controller.matchDetailResponse.score!.fullTime!.home} : ${controller.matchDetailResponse.score!.fullTime!.away!}',
                            style: GoogleFonts.nunito(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Sắp diễn ra',
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Temp.processImage1(
                      imageUrl: Validate.nullOrEmpty(
                              controller.matchDetailResponse.awayTeam!.crest!)
                          ? ''
                          : controller.matchDetailResponse.awayTeam!.crest!,
                      height: 70,
                      widght: 70,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      Validate.nullOrEmpty(controller
                              .matchDetailResponse.awayTeam!.shortName)
                          ? ''
                          : controller.matchDetailResponse.awayTeam!.shortName!,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 10,
        ),
        // test ADS
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _customADS('https://s11.gifyu.com/images/SWGnm.gif')),
        // tabbar
        Expanded(
          child: ContainedTabBarView(
            // initialIndex: controller.selectTed,
            onChange: (p0) {
              //  controller.clickTabBar(p0);
            },
            tabBarProperties: TabBarProperties(
              indicatorColor: ColorResources.MAIN,
              alignment: TabBarAlignment.start,
              isScrollable: true,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            tabs: [
              _itemTabBar(text: 'Tổng quan'),
              _itemTabBar(text: 'Tỉ lệ cá cược'),
              _itemTabBar(text: 'Đội hình'),
              _itemTabBar(text: 'H2H'),
            ],
            views: [
              _tabTongQuan(controller),
              _tabTiLeCuoc(controller),
              _tabDoiHinh(controller),
              _tabH2H(controller),
            ],
          ),
        ),
      ],
    );
  }

  ///
  /// item tabbar
  ///
  Widget _itemTabBar({required String text, double? widght}) {
    return Container(
      // width: widght ?? Get.width / 3.5,
      margin: EdgeInsets.only(
        right: 20,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  ///
  /// appBar
  ///
  AppBar _appBar(MatchDetailController controller) {
    return AppBar(
      backgroundColor: ColorResources.BACKGROUND,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 20,
        ),
      ),
      centerTitle: true,
      actions: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: SvgPicture.network(
            Validate.nullOrEmpty(controller.matchDetailResponse.area!.flag)
                ? ''
                : controller.matchDetailResponse.area!.flag!,
            height: 18,
            width: 18,
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
            ),
            child: Image.network(
              Validate.nullOrEmpty(
                      controller.matchDetailResponse.competition!.emblem)
                  ? ''
                  : controller.matchDetailResponse.competition!.emblem!,
              height: 30,
              width: 30,
            ),
          ),
          SizedBox(width: 10),
          Text(
            controller.matchDetailResponse.competition!.name!,
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

///
/// tabbar tông quan
///
Widget _tabTongQuan(MatchDetailController controller) {
  return Stack(
    children: [
      Container(
        child: controller.videoPlayerController!.value.isInitialized
            ? AspectRatio(
                aspectRatio:
                    controller.videoPlayerController!.value.aspectRatio,
                child: VideoPlayer(controller.videoPlayerController!),
              )
            : Container(),
      ),
      // ads
      Positioned(
          bottom: 0, child: _customADS('https://i.imgur.com/NC96MeM.gif'))
    ],
  );
}

///
/// tabbar tỉ lệ cược
///
Widget _tabTiLeCuoc(MatchDetailController controller) {
  return Container(
    margin: EdgeInsets.only(
      top: 20,
      bottom: 10,
    ),
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Temp.processImage1(
                  imageUrl: Validate.nullOrEmpty(
                          controller.matchDetailResponse.homeTeam!.crest!)
                      ? ''
                      : controller.matchDetailResponse.homeTeam!.crest!,
                  height: 40,
                  widght: 40,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  Validate.nullOrEmpty(
                          controller.matchDetailResponse.odds!.homeWin)
                      ? '0'
                      : controller.matchDetailResponse.odds!.homeWin!
                          .toString(),
                  style: GoogleFonts.nunito(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Temp.processImage1(
                      imageUrl: Validate.nullOrEmpty(
                              controller.matchDetailResponse.homeTeam!.crest!)
                          ? ''
                          : controller.matchDetailResponse.homeTeam!.crest!,
                      height: 40,
                      widght: 40,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Temp.processImage1(
                      imageUrl: Validate.nullOrEmpty(
                              controller.matchDetailResponse.awayTeam!.crest!)
                          ? ''
                          : controller.matchDetailResponse.awayTeam!.crest!,
                      height: 40,
                      widght: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  Validate.nullOrEmpty(
                          controller.matchDetailResponse.odds!.draw)
                      ? '0'
                      : 'H : ' +
                          controller.matchDetailResponse.odds!.draw!.toString(),
                  style: GoogleFonts.nunito(
                    color: Colors.orangeAccent,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Temp.processImage1(
                  imageUrl: Validate.nullOrEmpty(
                          controller.matchDetailResponse.awayTeam!.crest!)
                      ? ''
                      : controller.matchDetailResponse.awayTeam!.crest!,
                  height: 40,
                  widght: 40,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  Validate.nullOrEmpty(
                          controller.matchDetailResponse.odds!.awayWin)
                      ? '0'
                      : controller.matchDetailResponse.odds!.awayWin!
                          .toString(),
                  style: GoogleFonts.nunito(
                    color: Colors.yellow,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ],
        ),
        //
        SizedBox(
          height: 8,
        ),
        Divider(
          height: 3,
          color: ColorResources.MAIN,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Key : ',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _itemKey(myColor: Colors.blue, text: 'Đội nhà thắng'),
        _itemKey(myColor: Colors.orangeAccent, text: 'Hòa'),
        _itemKey(myColor: Colors.yellow, text: 'Đội khách thắng'),

        // test custom ADS
        const Spacer(),
        _customADS('https://i.imgur.com/NC96MeM.gif'),
      ],
    ),
  );
}

///
/// item key
///
Widget _itemKey({required Color myColor, required String text}) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: myColor,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

///
/// tabbar đội hình
///
Widget _tabDoiHinh(MatchDetailController controller) {
  return Container();
}

///
/// tabbar H2H
///
Widget _tabH2H(MatchDetailController controller) {
  return controller.isLoadingH2H == false
      ? LoadingIndicator()
      : Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
               // số bàn thắng
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Text(controller.dataH2h['aggregates']['homeTeam']['wins'].toString(),style: GoogleFonts.nunito(
                    color: Colors.blue,
                    fontSize: 14,
                   ),),
                   Text('Số bàn thắng',style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 14,
                   ),),
                   Text(controller.dataH2h['aggregates']['awayTeam']['wins'].toString(),style: GoogleFonts.nunito(
                    color: Colors.yellow,
                    fontSize: 14,
                   ),),
                 ],
               ),
               Divider(color: ColorResources.MAIN,),

               
              Expanded(
                child: Column(
                  children: List.generate(
                    controller.dataH2h['resultSet']['count'] as int,
                    (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // home team
                                Row(
                                  children: [
                                    Temp.processImage1(
                                      imageUrl: Validate.nullOrEmpty(
                                              controller.dataH2h['matches'][index]
                                                  ['homeTeam']['crest'])
                                          ? ''
                                          : controller.dataH2h['matches'][index]
                                              ['homeTeam']['crest'],
                                      height: 20,
                                      widght: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      Validate.nullOrEmpty(
                                              controller.dataH2h['matches'][index]
                                                  ['homeTeam']['shortName'])
                                          ? '0'
                                          : controller.dataH2h['matches'][index]
                                              ['homeTeam']['shortName'],
                                      style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      Validate.nullOrEmpty(
                                              controller.dataH2h['matches'][index]
                                                  ['score']['fullTime']['home'])
                                          ? '0'
                                          : controller.dataH2h['matches'][index]['score']
                                                  ['halfTime']['home']
                                              .toString(),
                                      style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      Validate.nullOrEmpty(
                                              controller.dataH2h['matches'][index]
                                                  ['score']['fullTime']['home'])
                                          ? '0'
                                          : controller.dataH2h['matches'][index]['score']
                                                  ['fullTime']['home']
                                              .toString(),
                                      style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // away team
                                Row(
                                  children: [
                                    Temp.processImage1(
                                      imageUrl: Validate.nullOrEmpty(
                                              controller.dataH2h['matches'][index]
                                                  ['awayTeam']['crest'])
                                          ? ''
                                          : controller.dataH2h['matches'][index]
                                              ['awayTeam']['crest'],
                                      height: 20,
                                      widght: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      Validate.nullOrEmpty(
                                              controller.dataH2h['matches'][index]
                                                  ['awayTeam']['shortName'])
                                          ? '0'
                                          : controller.dataH2h['matches'][index]
                                              ['awayTeam']['shortName'],
                                      style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      Validate.nullOrEmpty(
                                              controller.dataH2h['matches'][index]
                                                  ['score']['halfTime']['away'])
                                          ? '0'
                                          : controller.dataH2h['matches'][index]['score']
                                                  ['halfTime']['away']
                                              .toString(),
                                      style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      Validate.nullOrEmpty(
                                              controller.dataH2h['matches'][index]
                                                  ['score']['fullTime']['away'])
                                          ? '0'
                                          : controller.dataH2h['matches'][index]['score']
                                                  ['fullTime']['away']
                                              .toString(),
                                      style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: ColorResources.MAIN.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ));
}

///
/// custom ADS
///
Widget _customADS(String url) {
  return Container(
    child: CachedNetworkImage(
      imageUrl: url,
      width: Get.width,
      placeholder: (context, url) => Container(
        color: ColorResources.BACKGROUND,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}
