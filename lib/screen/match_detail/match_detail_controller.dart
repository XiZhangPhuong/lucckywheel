import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:luckywheel/model/football/match_detail_response.dart';
import 'package:luckywheel/repository/footballl_repository.dart';
import 'package:video_player/video_player.dart';
class MatchDetailController extends GetxController {
  MatchDetailResponse matchDetailResponse = MatchDetailResponse();
  bool isLoading = false;
  final FoodBallRespository _foodBallRespository = FoodBallRespository();
  int id = Get.arguments as int;

  //video player
  VideoPlayerController? videoPlayerController ; 
  String urlVideo = 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4';
  String urlFootBall = '';

  //get h2h
  dynamic dataH2h = null;
  bool isLoadingH2H = false;
  @override
  void onInit() {
    super.onInit();
     initVideoPlayer();
    _getMatchDetail();
    getH2H();
  }

  @override
  void onClose() {
    videoPlayerController!.dispose();
    super.onClose();
  }

  ///
  /// init videoPlayer
  ///
  void initVideoPlayer(){
   try{
     videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(urlVideo))..initialize();
     videoPlayerController!.play();
    print(videoPlayerController!.dataSource);
    videoPlayerController!.setLooping(true);
    update();
   }catch(e){
    print(e);
   }
  }

  ///
  /// get match detail : chi tiết trận đấu
  ///
  Future<void> _getMatchDetail() async {
    await _foodBallRespository.getMatchDetail(
      id: id,
      onSuccess: (data) {
        matchDetailResponse = data;
        print(data.toMap());
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get h2h
  ///
  void getH2H(){
    _foodBallRespository.getH2H(id: id, onSuccess: (data) {
        dataH2h = data;
        isLoadingH2H = true;
        print(data);
        update();
    }, onError: (e) {
      print(e);
    },); 
  }
}
