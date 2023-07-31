import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/model/football/cacgiaidau_response.dart';
import 'package:luckywheel/model/football/competitions_response.dart';
import 'package:luckywheel/model/football/stading_response.dart';
import 'package:luckywheel/model/football/team_responsee.dart';
import 'package:luckywheel/model/football/top_score_response.dart';
import 'package:luckywheel/model/football/video_response.dart';
import 'package:luckywheel/repository/footballl_repository.dart';
import 'package:luckywheel/routes/routes_path/home_routes.dart';
import 'package:luckywheel/shares/shared_preference_helper.dart';
import 'package:luckywheel/temp.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeController extends GetxController {
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
  // bắt sự kiện cuộn lịch thi đấu
  ScrollController scrollControllerScheDule = ScrollController();
  final scrollDirection = Axis.vertical;
  AutoScrollController? scrollControllerSchedule  ;

  // list các đội vô địch theo mùa
  bool isLoadingChampion = false;
  List<dynamic> listChamion = [];
  
  // list team
  bool isLoadingTeam = false;
  dynamic dataTeam = [];
  int currentIndexTeam = 0;
  // logo Doi Bong
  String? logo = '';

  // list schdule by team
  bool isLoadingScheduleByTeam = false;
  dynamic dataScheDuleByteam = [];
  int idTeam = 0;
  String teamName = '';
  // select ...
  int selectTed = 0;
  @override
  void onInit() {
    super.onInit();
    scrollControllerTopScore.addListener(_scrollListener);
   // scrollControllerScheDule.addListener(_scrollListenerScheDule);
    initListYear();
    getAll();
    getStanDing();
    getTopScore();
    getChampion();
    getTeam();
  }

  @override
  void onClose() {
    scrollControllerTopScore.removeListener(() {
      _scrollListener();
    });
    scrollControllerTopScore.dispose();
    scrollControllerScheDule.removeListener(() {
     
    });
    scrollControllerScheDule.dispose();
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
    isLoadingScheduleByTeam = false;
    currentYear = value;
    limitTopScore = 20;
    listGiaiDau.clear();
    compertitionResponse = CompetitionsResponse();
    listTopScore.clear();
    dataScheDuleByteam  = null;
    dataTeam = null;
    getAll();
    getStanDing();
    getTopScore();
    getScheDuleyTeam();
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
  /// lấy các đội vô địch theo mùa
  ///
  Future<void> getChampion() async {
    await _foodBallRespository.getChampion(
      onSuccess: (data) {
        listChamion = data;
        isLoadingChampion = true;
        update();
      },
      onError: (e) {
        isLoadingChampion = false;
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
  /// go to match detail
  ///
  void gotoMatchDetail(int id) {
    Get.toNamed(HomeRoutes.MATCH_DETAIL, arguments: id);
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

  ///
  /// lắng nghe cuộn lịch thi đấu theo ngày hiện tại
  ///
  void _scrollListenerScheDule(BuildContext context) {
    scrollControllerSchedule  = AutoScrollController(
      axis: scrollDirection,
      
    );

  }

  ///
  /// get team
  ///
  Future<void> getTeam() async {
    await _foodBallRespository.getTeam(
      season: currentYear,
      onSuccess: (data) {
        dataTeam = data;
        print(data);
        isLoadingTeam = true;
        update();
      },
      onError: (e) {
        print(e);
        isLoadingTeam = false;
      },
    );
  }

  ///
  /// click bottom sheeet
  ///
  void clickBottomSheet(int index) {
    currentIndexTeam = index;
    update();
  }

  ///
  /// lấy lịch thi đấu của 1 đội tuyển trong 1 mùa giải
  ///
  Future<void> getScheDuleyTeam() async {
    await _foodBallRespository.getScheDuleByTeam(
      idTeam: idTeam,
      season: currentYear,
      onSuccess: (data) {
        dataScheDuleByteam = data;
        isLoadingScheduleByTeam = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// show bottom sheet get team
  ///
  void showBottomSheetGetTeam() {
    Get.bottomSheet(
      backgroundColor: ColorResources.BACKGROUND,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      Container(
        padding: EdgeInsets.all(5.0),
        height: Get.height * 0.8,
        child: Column(
          children: [
            // SizedBox(
            //   height: 8,
            // ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Chọn câu lạc bộ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black87,
            ),
            ListTile(
              onTap: () {
                logo = '';
                idTeam = 0;
                Get.back();
                update();
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: SvgPicture.network(
                  'https://crests.football-data.org/770.svg',
                  height: 18,
                  width: 18,
                ),
              ),
              title: Text(
                'Tất cả câu lạc bộ',
                style: GoogleFonts.nunito(
                  fontSize: Validate.nullOrEmpty(logo) ? 18 : 14,
                  color: Validate.nullOrEmpty(logo)
                      ? ColorResources.MAIN
                      : Colors.white,
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(20, (index) {
                    final item = dataTeam['teams'][index];
                    return ListTile(
                      onTap: () {
                        clickBottomSheet(index);
                        logo = item['crest'].toString();
                        teamName = item['shortName'].toString();
                        idTeam = item['id'] as int;
                        getScheDuleyTeam();
                        Get.back();
                        update();
                      },
                      leading: Temp.processImage1(
                        imageUrl: item['crest'].toString(),
                        height: 30,
                        widght: 30,
                      ),
                      title: Text(
                        item['shortName'].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: Validate.nullOrEmpty(logo)
                              ? 14
                              : index == currentIndexTeam
                                  ? 18
                                  : 14,
                          color: Validate.nullOrEmpty(logo)
                              ? Colors.white
                              : index == currentIndexTeam
                                  ? ColorResources.MAIN
                                  : Colors.white,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// Colors borderAll ListView
  ///
  Color colorBorderListView({required String utcDay}) {
    List<String> listTime = utcDay.split("-");
    int day = DateTime.now().day;
    int month = DateTime.now().month;   
    if (listTime.last =='${day}/${month}') {
      return Colors.blue;
    }
    return Colors.white;
  }

  ///
  ///
  ///
  Widget notifiOrText(
      {required String status,
      required String finished,
      required String utcDate}) {
    if (status == 'FINISHED') {
      return Text(
        finished,
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 22,
        ),
      );
    }
    DateTime convertedDate =
        DateFormat('HH:mm-dd/MM').parse(Temp.convertUtcToVietnamTime(utcDate));
    DateTime targetDate = DateFormat('HH:mm-dd/MM').parse(DateFormat('HH:mm-dd/MM').format(DateTime.now()));
    if (convertedDate.isBefore(targetDate)) {
      return Container(
        margin: EdgeInsets.only(top: 5.0),
        child: Text(
          'Sắp diễn ra',
          style: GoogleFonts.nunito(
            color: Colors.blue,
            fontSize: 16,
          ),
        ),
      );
    } else if (convertedDate.day == targetDate.day &&
           convertedDate.month == targetDate.month &&
           convertedDate.year == targetDate.year) {
      return Container(
        margin: EdgeInsets.only(top: 5.0),
        child: Text(
          'Trực tiếp',
          style: GoogleFonts.nunito(
            color: Colors.red,
            fontSize: 16,
          ),
        ),
      );
    }
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.notifications_none,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
