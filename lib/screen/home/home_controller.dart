import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/model/football/cacgiaidau_response.dart';
import 'package:luckywheel/model/football/competitions_response.dart';
import 'package:luckywheel/model/football/stading_response.dart';
import 'package:luckywheel/model/football/team_responsee.dart';
import 'package:luckywheel/model/football/top_score_response.dart';
import 'package:luckywheel/model/football/video_response.dart';
import 'package:luckywheel/repository/footballl_repository.dart';
import 'package:luckywheel/repository/video_repository.dart';
import 'package:luckywheel/routes/routes_path/home_routes.dart';
import 'package:luckywheel/shares/shared_preference_helper.dart';

class HomeController extends GetxController {
  final VideoRepository _videoRepository = VideoRepository();
  List<dynamic> listVideo = [];
  CompetitionsResponse compertitionResponse = CompetitionsResponse();
  VideoResponse videoResponse = VideoResponse();
  bool isLoading = false;
  final FoodBallRespository _foodBallRespository = FoodBallRespository();
  bool isLoadingGiaiDau = false;
  bool isLoadingScheDule = false;
  bool isLoadingStanding = false;
  StadingResponse stadingResponse = StadingResponse();
  List<CacGiaiDauResponse> listGiaiDau = [];
  List<String> listVongDau = [];
  String valueVongDau = '';
  int currentYear = 0;
  int matchday = 1;
  // list năm các mùa giải Ngoại Hạng Anh 2020 - 2023
  List<int> listYear = [];

  // list top score
  List<TopScoreResponse> listTopScore = [];
  bool isLoadingTopScore = false;
  int limitTopScore = 20;
  // bắt sự kiện cuộn Top bàn thắng
  ScrollController scrollControllerTopScore = ScrollController();
  List<Map<String, dynamic>> dataList = [
    {
      'url': 'https://flagcdn.com/w320/vn.png',
      'title': 'VietNam',
    },
    {
      'url': 'https://flagcdn.com/w320/us.png',
      'title': 'USA',
    },
    {
      'url': 'https://flagcdn.com/w320/kr.png',
      'title': 'Korea',
    },
    {
      'url': 'https://flagcdn.com/w320/cn.png',
      'title': 'China',
    },
    {
      'url': 'https://flagcdn.com/w320/jp.png',
      'title': 'Japan',
    },
    {
      'url': 'https://flagcdn.com/w320/in.png',
      'title': 'India',
    },
    {
      'url': 'https://flagcdn.com/w320/es.png',
      'title': 'Spain',
    },
    {
      'url': 'https://flagcdn.com/w320/it.png',
      'title': 'Italy',
    },
    {
      'url': 'https://flagcdn.com/w320/ru.png',
      'title': 'Russia',
    },
  ];

  List<Map<String, dynamic>> listMenu = [
    {
      'image':
          'https://apod.nasa.gov/apod/image/2307/DracoTrio_TeamOmicron1024.jpg',
      'title': 'Apod'
    },
    {
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/869/422/non_2x/human-overpopulation-chalk-rgb-color-concept-icon-birth-rate-increase-international-population-ecological-footprint-society-idea-isolated-chalkboard-illustration-on-black-background-free-vector.jpg',
      'title': 'Polulation'
    },
    {
      'image': '',
      'title': 'Language',
    }
  ];
  int selectTed = 0;
  @override
  void onInit() {
    super.onInit();
    scrollControllerTopScore.addListener(_scrollListener);
    initListYear();
    getAll();
    getStanDing();
    getTopScore();
  }

  @override
  void onClose() {
    scrollControllerTopScore.removeListener(() {
      _scrollListener();
    });
    scrollControllerTopScore.dispose();
    super.onClose();
  }

  ///
  /// init list year
  ///
  void initListYear() {
    currentYear = DateTime.now().year;
    listYear.add(currentYear);
    for (int i = 1; i <= 3; i++) {
      listYear.add(currentYear - i);
    }
  }

  ///
  /// clickSearchYear
  ///
  void clickSearchYearch(int value) {
    // xu li call lai API
    isLoadingScheDule = false;
    isLoadingStanding = false;
    isLoadingTopScore = false;
    currentYear = value;
    limitTopScore = 20;
    listGiaiDau.clear();
    compertitionResponse = CompetitionsResponse();
    listTopScore.clear();
    getAll();
    getStanDing();
    getTopScore();
  }

  ///
  /// click tabbar
  ///
  void clickTabBar(int index) {
    selectTed = index;
    print(index);
    update();
  }

  ///
  /// init vong ddau
  ///
  void initVongDau() {
    listVongDau.add('Chọn vòng đấu');
    for (int i = 1; i <= 38; i++) {
      listVongDau.add('Vòng ${i}');
    }
    valueVongDau = listVongDau.first;
  }

  ///
  /// chage Dropdowbutotn
  ///
  void clickDropDowButton(String value) {
    valueVongDau = value;
    // for(final i in listVongDau){
    //   if(i==value){
    //     print(i);
    //     break;
    //   }
    // }
    update();
  }

  ///
  /// Gọi tất cả các trận đấu sắp diễn ra ở Ngoại Hạng Anh
  ///
  Future<void> getAll() async {
    await _foodBallRespository.getAllScheDuledPL(
      code: 'PL',
      season: currentYear,
      onSuccess: (data) {
        compertitionResponse = data;
        isLoadingScheDule = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// change language
  ///
  void changeLanguage(int index) {
    selectTed = index;
    setStringLanguage(index);
    print(selectTed);
    update();
    Get.back();
  }

  ///
  /// set String language
  ///
  void setStringLanguage(int index) {
    switch (index) {
      case 0:
        SharedPreferenceHelper.setString('key', 'vi');
        Get.updateLocale(const Locale('vi_VN'));
        break;
      case 1:
        SharedPreferenceHelper.setString('key', 'en');
        Get.updateLocale(Locale('en', 'US'));
        break;
      case 2:
        SharedPreferenceHelper.setString('key', 'ko');
        Get.updateLocale(const Locale('ko_KR'));
        break;
      case 3:
        SharedPreferenceHelper.setString('key', 'zh');
        Get.updateLocale(const Locale('zh_CN'));
        break;
      case 4:
        SharedPreferenceHelper.setString('key', 'jp');
        Get.updateLocale(const Locale('ja_JP'));
        break;
      case 5:
        SharedPreferenceHelper.setString('key', 'in');
        Get.updateLocale(const Locale('en_IN'));
        break;
      case 6:
        SharedPreferenceHelper.setString('key', 'es');
        Get.updateLocale(const Locale('es_ES'));
        break;
      case 7:
        SharedPreferenceHelper.setString('key', 'it');
        Get.updateLocale(const Locale('it_IT'));
        break;
      case 8:
        SharedPreferenceHelper.setString('key', 'ru');
        Get.updateLocale(const Locale('ru_RU'));
        break;
    }
  }

  ///
  /// get video
  ///
  Future<void> getVideo() async {
    await _videoRepository.getVideo(onError: (e) {
      print(e);
    }, onSuccess: (data) {
      videoResponse = data;
      print(videoResponse.toMap());
      isLoading = true;
      update();
    });
  }

  ///
  /// go to videp
  ///
  void gotoVideo(String html) {
    Get.toNamed(HomeRoutes.VIDEOS, arguments: html);
  }

  ///
  /// get giải đấu lớn trên thế giới
  ///
  Future<void> getAllCompetition() async {
    await _foodBallRespository.getCompetition(
      onSuccess: (data) {
        listGiaiDau = data;

        isLoadingGiaiDau = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// xử lí hình ảnh
  ///
  Widget processImage1(
      {required imageUrl, double? height, double? widght, Widget? onLoading}) {
    final String extension = imageUrl.substring(imageUrl.length - 3);

    if (extension.toLowerCase() == 'png') {
      String svgUrl = imageUrl.replaceAll('.png', '.svg');
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SvgPicture.network(
          svgUrl,
          height: height ?? 50,
          width: widght ?? 50,
          placeholderBuilder: (BuildContext context) =>
              onLoading ?? CircularProgressIndicator(),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SvgPicture.network(imageUrl,
            height: height ?? 50,
            width: widght ?? 50,
            placeholderBuilder: (BuildContext context) =>
                onLoading ?? CircularProgressIndicator()),
      );
    }
  }

  ///
  /// thống kê bảng xếp hạng
  ///
  Future<void> getStanDing() async {
    await _foodBallRespository.getStanding(
      code: 'PL',
      season: currentYear,
      onSuccess: (data) {
        stadingResponse = data;
        isLoadingStanding = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// lấy top cầu thủ ghi bàn
  ///
  Future<void> getTopScore() async {
    await _foodBallRespository.getTopScore(
      season: currentYear,
      limit: limitTopScore,
      onSuccess: (data) {
        listTopScore = data;
        isLoadingTopScore = true;
        update();
      },
      onError: (e) {
        isLoadingTopScore = false;
        print(e);
      },
    );
  }

  ///
  /// go to team page
  ///
  void gotoTeamPage(int sent) {
    Get.toNamed(HomeRoutes.TEAM, arguments: sent);
  }

  ///
  /// lắng nghe sự kiện cuộn top bàn thắng
  ///
  void _scrollListener() {
    if (scrollControllerTopScore.position.pixels ==
        scrollControllerTopScore.position.maxScrollExtent) {
      if (isLoadingTopScore == true) {
        if (limitTopScore < 100) {
          limitTopScore += 10;
        }
        getTopScore();
      }
    }
  }
}
