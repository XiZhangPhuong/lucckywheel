import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/repository/footballl_repository.dart';
import 'package:luckywheel/repository/movie_repository.dart';
import 'package:luckywheel/routes/routes_path/movie_routes.dart';
import 'package:luckywheel/temp.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MovieController extends GetxController {
  List<String> listImage = [
    'https://www.vietnamfineart.com.vn/wp-content/uploads/2023/03/top-10-phim-dien-anh-anime-hay-va-cam-dong-nhat_623808908c665-5.jpeg',
    'https://simg.zalopay.com.vn/zlp-website/assets/Thumb_phim_anime_hay_653dbb8e87.jpg',
    'https://cdn.popsww.com/blog/sites/2/2021/07/phim-hoat-hinh-nhat-ban.jpg',
    'https://cdn.popsww.com/blog/sites/2/2021/10/nhung-bo-phim-hoat-hinh-hay-nhat-cua-nhat-ban.jpg',
    'https://shizen.edu.vn/wp-content/uploads/2020/11/Anime-Phim-ho%E1%BA%A1t-h%C3%ACnh-Nh%E1%BA%ADt-B%E1%BA%A3n.jpg',
  ];
  final MovieRepository _movieRepository = MovieRepository();
  final FoodBallRespository _foodBallRespository = FoodBallRespository();
  // get anime
  List<dynamic> listAnime = [];
  bool isLoading = false;
  int page = 1;
  int size = 12;
  RefreshController scrollController = RefreshController();
  // get genre
  List<dynamic> listGenre = [];
  bool isLoadingGenre = false;
  int currenIndex = 0;

  // get hentai anime

  // get popular movie
  List<dynamic> listPopuLarMovie = [];
  bool isLoadingPopuLar = false;

  // get toprated movie
  List<dynamic> listTopRatedMovie = [];
  bool isLoadingTopRated = false;

  // get now playing
  List<dynamic> listNowPlayingMovie = [];
  bool isLoadingNowPlaying = false;

  // get airning tv todat
  List<dynamic> listAriningToday = [];
  bool isLoadingArirningToday = false;

  // get maches todya
  List<dynamic> listMatches = [];
  bool isLoadingMatches = false;

  // get all team football
  List<dynamic> listTeamFootball = [];
  bool isLoadingTeamFootball = false;

  // get data word cup
  dynamic dataWordCup = null;
  bool isLoadingDataWordCup = false;
  ScrollController scrollControllerWordCup = ScrollController();

  // get data UEfA
  dynamic dataUEFA = null;
  bool isLoadingUEFA = false;

  // get all video phim
  List<dynamic> listVideoMovie = [];
  bool isLoadingVideoMovie = false;
  int id = 0;

  // get mathch detail
  dynamic dataMathchDetail = null;
  bool isLoadingDataMathDetail = false;

  @override
  void onInit() {
    super.onInit();
    // getAllGenres();
    getAnime();
    _getPopularMovie();
    _getTopRaredMovie();
    _getNowPlayingMovie();
    _getMatches();
    _getAllTeamFootBall();
    _getDataWordCup();
    _getDataUEFA();
    _getAirninToDayTV();
  }

  @override
  void onClose() {
    scrollController.dispose();
    scrollControllerWordCup.dispose();
    super.onClose();
  }

  ///
  /// change tabbar
  ///
  Future<void> changeTabBar({required int index, required String gend}) async {
    currenIndex = index;
    await getAnime();
    update();
  }

  ///
  /// get popular movie :  danh sách phim phổ biến
  ///
  ///
  Future<void> _getPopularMovie() async {
    await _movieRepository.getPopularMovie(
      page: 1,
      onSuccess: (data) {
        listPopuLarMovie = data;
        isLoadingPopuLar = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get top rared movie
  ///
  Future<void> _getTopRaredMovie() async {
    await _movieRepository.getTopRatedMovie(
      page: 1,
      onSuccess: (data) {
        listTopRatedMovie = data;
        listTopRatedMovie.shuffle();
        isLoadingTopRated = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get top rared movie
  ///
  Future<void> _getNowPlayingMovie() async {
    await _movieRepository.getNowPlaying(
      page: 1,
      onSuccess: (data) {
        listNowPlayingMovie = data;
        isLoadingNowPlaying = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get airning tv today
  ///
  Future<void> _getAirninToDayTV() async {
    await _movieRepository.getAiringToday(
      page: 1,
      onSuccess: (data) {
        listAriningToday = data;
        isLoadingArirningToday = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// go to detail anime
  ///
  void gotoDetailAnime({required int id}) {
    Get.toNamed(MovieRoutes.DETAIL_ANIME, arguments: id);
  }

  ///
  /// get anime
  ///
  Future<void> getAnime() async {
    await _movieRepository.getAllAnime(
      page: page,
      size: size,
      onSuccess: (resuilt) {
        listAnime = resuilt;
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// on Loading
  ///
  void onLoading() async {
    await Future.delayed(Duration(seconds: 1));
    page++;
    await getAnime();
    scrollController.loadComplete();
    update();
  }

  ///
  /// on refresh
  ///
  void onRefreshing() async {
    listAnime.clear();
    size = 12;
    await getAnime();
    scrollController.refreshCompleted();
    update();
  }

  ///
  /// go to hentai anime
  ///
  void gotoHentaiAnime() {
    Get.toNamed(MovieRoutes.ANIME);
  }

  ///
  /// getAllGenres
  ///
  Future<void> getAllGenres() async {
    await _movieRepository.getAllGenres(
      onSuccess: (resuilt) {
        listGenre = resuilt;
        getAnime();
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get matches
  ///
  Future<void> _getMatches() async {
    await _foodBallRespository.getMachesToday(
      onSuccess: (listData) {
        listMatches = listData;
        isLoadingMatches = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get all team football
  ///
  Future<void> _getAllTeamFootBall() async {
    await _foodBallRespository.getAllTeamTournament(
      code: 'PL',
      onSuccess: (data) {
        listTeamFootball = data;
        isLoadingTeamFootball = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// data word cup
  ///
  Future<void> _getDataWordCup() async {
    await _foodBallRespository.getAllScheDule(
      code: 'WC',
      onSuccess: (data) {
        dataWordCup = data;
        isLoadingDataWordCup = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ////
  /// data UEFA
  ///
  Future<void> _getDataUEFA() async {
    await _foodBallRespository.getAllScheDule(
      code: 'CL',
      onSuccess: (data) {
        dataUEFA = data;
        isLoadingUEFA = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get all video movie
  ///
  Future<void> getAllVideoMovie(
      {required int id, required String media_type}) async {
    await _movieRepository.getAllVideoMovie(
      media_type: media_type,
      id: id,
      onSuccess: (data) {
        listVideoMovie = data;
        isLoadingVideoMovie = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// show bottot sheet team football by id
  ///
  Future<void> showBottomSheetMovie(
      {required int id,
      required BuildContext context,
      required String media_type}) async {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Đảm bảo dialog không thể đóng khi bấm ra ngoài
      builder: (context) => LoadingIndicator(),
    );
    await getAllVideoMovie(id: id, media_type: media_type);
    Get.back();
    Get.bottomSheet(
      Container(
        height: Get.height * 0.9,
        child: isLoadingVideoMovie == false
            ? LoadingIndicator()
            : listVideoMovie.isNotEmpty
                ? WebView(
                    initialUrl:
                        'https://www.youtube.com/watch?v=${listVideoMovie[Temp.indexMovieTrailer(data: listVideoMovie)]['key']}',
                    javascriptMode: JavascriptMode.unrestricted,
                    debuggingEnabled: true,
                    // Cho phép cuộn trong WebView
                    gestureRecognizers: Set()
                      ..add(Factory<VerticalDragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer())),
                  )
                : Center(
                    child: Text(
                      'No data',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
      ),
      backgroundColor: ColorResources.BACKGROUND,
      isScrollControlled: true,
    );
  }

  ///
  /// get detail match by id
  ///
  Future<void> _getDetalMathchByID({required int idMathch}) async {
    await _foodBallRespository.getMatchDetail(
      id: idMathch,
      onSuccess: (data) {
        dataMathchDetail = data;
        isLoadingDataMathDetail = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// show bottom sheet foot ball
  ///
  Future<void> showBottomSheetFootBall(
      {required int idMatch,
      required dynamic item,
      required BuildContext context}) async {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Đảm bảo dialog không thể đóng khi bấm ra ngoài
      builder: (context) => LoadingIndicator(),
    );
    await _getDetalMathchByID(idMathch: idMatch);
    Get.back();
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: ColorResources.BACKGROUND,
      Container(
        height: Get.height * 0.8,
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Row(
                children: [
                  Container(
                    child: Validate.nullOrEmpty(item['area']['flag'])
                        ? Container()
                        : item['area']['flag'].toString().endsWith('.png')
                            ? Image.network(
                                item['area']['flag'],
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover,
                              )
                            : SvgPicture.network(
                                item['area']['flag'],
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    Validate.nullOrEmpty(item['competition']['name'])
                        ? 'No name'
                        : item['competition']['name'],
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Spacer(),
                  Container(
                    child: Validate.nullOrEmpty(item['area']['flag'])
                        ? Container()
                        : item['area']['flag'].toString().endsWith('.png')
                            ? Image.network(
                                item['area']['flag'],
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover,
                              )
                            : SvgPicture.network(
                                item['area']['flag'],
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    Validate.nullOrEmpty(item['area']['name'])
                        ? 'No name'
                        : item['area']['name'],
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
              SizedBox(
                height: 15,
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Validate.nullOrEmpty(item['homeTeam']['crest'])
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
                                    fit: BoxFit.cover,
                                  )
                                : SvgPicture.network(
                                    item['homeTeam']['crest'],
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                        SizedBox(height: 5.0),
                        Text(
                          Validate.nullOrEmpty(item['homeTeam']['shortName'])
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
                        Validate.nullOrEmpty(item['score']['fullTime']['home'])
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Validate.nullOrEmpty(item['awayTeam']['crest'])
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
                                    fit: BoxFit.cover,
                                  )
                                : SvgPicture.network(
                                    item['awayTeam']['crest'],
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                        SizedBox(height: 5.0),
                        Text(
                          Validate.nullOrEmpty(item['awayTeam']['shortName'])
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
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white30,
              ),
              //
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    Validate.nullOrEmpty(item['utcDate'])
                        ? 'No data'
                        : Temp.convertUtcToVietnamTime(item['utcDate']),
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.stadium_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    Validate.nullOrEmpty(item['venue'])
                        ? 'No data'
                        : Temp.convertUtcToVietnamTime(item['venue']),
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
        
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timeline_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    Validate.nullOrEmpty(item['matchday'])
                        ? 'No data'
                        : item['matchday'].toString(),
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.rounded_corner_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    Validate.nullOrEmpty(item['stage'])
                        ? 'No data'
                        : item['stage'],
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
        
              SizedBox(
                height: 10,
              ),
              Validate.nullOrEmpty(item['referees'])
                  ? Container()
                  : Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          Validate.nullOrEmpty(item['referees'][0]['name'])
                              ? 'No data'
                              : item['referees'][0]['name'].toString(),
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.flag_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          Validate.nullOrEmpty(item['referees'][0]['nationality'])
                              ? 'No data'
                              : item['referees'][0]['nationality'].toString(),
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white30,
              ),
              SizedBox(
                height: 5,
              ),
        
              Text(
                'Odds : ',
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 15,
                    width: 10,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    Validate.nullOrEmpty(item['odds']['homeWin'])
                        ? '0'
                        : item['odds']['homeWin'].toString(),
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 15,
                    width: 10,
                    color: Colors.yellowAccent,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    Validate.nullOrEmpty(item['odds']['draw'])
                        ? '0'
                        : item['odds']['draw'].toString(),
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 15,
                    width: 10,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    Validate.nullOrEmpty(item['odds']['awayWin'])
                        ? '0'
                        : item['odds']['awayWin'].toString(),
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white30,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Note : ',
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'UTC Date',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.stadium_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Stadium',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timeline_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'MathchDay',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.rounded_corner_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Stage',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Referees',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.flag_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Nationality',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 10,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Home Win',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 5,
              ),
               Container(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 10,
                      color: Colors.yellowAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Draw',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 5,
              ),
               Container(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 10,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Away Win',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// show bottot sheet team football by id
  ///
  void showBottomSheetAnime({required String url}) {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          color: Colors.white,
        ),
        child: url.isNotEmpty
            ? WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                debuggingEnabled: true,

                // Cho phép cuộn trong WebView
                gestureRecognizers: Set()
                  ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
              )
            : Center(
                child: Text(
                  'No data',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }
}
