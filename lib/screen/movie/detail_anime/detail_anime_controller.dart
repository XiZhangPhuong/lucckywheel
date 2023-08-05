import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/repository/movie_repository.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailAnimeController extends GetxController {
  //int id = Get.arguments as int;
  final MovieRepository _movieRepository = MovieRepository();
  VideoPlayerController? videoPlayerController;
  int id = Get.arguments as int;
  // detail movie
  dynamic dataMovie = null;
  List<dynamic> listGenres = [];
  List<dynamic> listSeason = [];
  bool isLoadingMovie = false;
  // get poformer
  List<dynamic> listPoforMer = [];
  bool isLoadingPoformer = false;
  // get video
  List<dynamic> listVideo = [];
  bool isLoadingVideo = false;
  // get similar movie
  List<dynamic> listSimilar = [];
  bool isLoadingSimila = false;

  @override
  void onInit() {
    super.onInit();
    _getDetailMovie();
    _getPoforMer();
    _getVideoMovie();
    _getSimiLarVideo();
  }

  ///
  ///  get detail movie
  ///
  Future<void> _getDetailMovie() async {
    await _movieRepository.getDetailMovie(
      id: id,
      onSuccess: (data) {
        dataMovie = data;
        print(data);
        listGenres = dataMovie['genres'];
        listSeason = dataMovie['seasons'];
        isLoadingMovie = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get poformer
  ///
  Future<void> _getPoforMer() async {
    await _movieRepository.getPoformerMovie(
      id: id,
      onSuccess: (data) {
        listPoforMer = data;
        isLoadingPoformer = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get video movie
  ///

  Future<void> _getVideoMovie() async {
    await _movieRepository.getAllVideoMovie(
      media_type: '',
      id: id,
      onSuccess: (data) {
        listVideo = data;
        isLoadingMovie = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// get similar video
  ///
  Future<void> _getSimiLarVideo() async {
    await _movieRepository.getSimilarMovie(
      id: id,
      onSuccess: (data) {
        listSimilar =  data;
        isLoadingSimila = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// showbottom sheet get trailer video
  ///
  void showBottomSheet({required List<dynamic> listData}) {
    Get.bottomSheet(
      backgroundColor: ColorResources.BACKGROUND,
      isScrollControlled: true,
      Container(
        height: Get.height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: listData.isEmpty
            ? Center(
                child: Text(
                  'Không có dữ kiệu',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  final item = listData[index];
                  YoutubePlayerController _controller = YoutubePlayerController(
                    initialVideoId: item['key'],
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    ),
                  );
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      //  progressIndicatorColor: ColorResources.MAIN,
                      // progressColors: ProgressBarColors(
                      //   playedColor: ColorResources.MAIN,
                      //   handleColor: ColorResources.MAIN,
                      // ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  ///
  /// init videoPlayer
  ///
  void initVideoPlayer(String urlVideo) {
    try {
      videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(urlVideo))..initialize();
      videoPlayerController!.play();
      print(videoPlayerController!.dataSource);
      videoPlayerController!.setLooping(true);
      update();
    } catch (e) {
      print(e);
    }
  }

  ///
  ///
  ///
  String convertVote(double number) {
    return number.toStringAsFixed(1);
  }
}
