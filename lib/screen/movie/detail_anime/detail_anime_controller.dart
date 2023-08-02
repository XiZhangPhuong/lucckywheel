import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:luckywheel/repository/movie_repository.dart';
import 'package:video_player/video_player.dart';

class DetailAnimeController extends GetxController {
  int id = Get.arguments as int;
  final MovieRepository _movieRepository = MovieRepository();
  VideoPlayerController? videoPlayerController  ;
  // detail movie
  dynamic dataMovie = null;
  bool isLoadingMovie = false;
  @override
  void onInit() {
    super.onInit();
    _getDetailMovie();
  }

  ///
  ///  get detail movie
  ///
  Future<void> _getDetailMovie() async {
    await _movieRepository.getDetailMovie(
      id: id,
      onSuccess: (data) {
        dataMovie = data;
        // initVideoPlayer('https://www.youtube.com/watch?v=/${dataMovie['videos']
        //                       ['results'][0]['key']}');
        isLoadingMovie = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  
  ///
  /// init videoPlayer
  ///
  void initVideoPlayer(String urlVideo){
   try{
     videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(urlVideo))..initialize(
     );
     videoPlayerController!.play();
    print(videoPlayerController!.dataSource);
    videoPlayerController!.setLooping(true);
    update();
   }catch(e){
    print(e);
   }
  }
}
