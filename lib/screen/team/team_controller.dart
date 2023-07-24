import 'package:get/get.dart';
import 'package:luckywheel/model/football/team_responsee.dart';
import 'package:luckywheel/repository/footballl_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamController extends GetxController{
  // init football respository
  final FoodBallRespository _footBallRepository  = FoodBallRespository();
  // get argument
  int id  = Get.arguments as int;
  bool isLoading = false;
  TeamResponse teamResponse =  TeamResponse();
  
  @override
  void onInit() {
    super.onInit();
    _getTeamById();
  }

 ///
/// get team
///
void _getTeamById(){
  _footBallRepository.detailtTeam(id: id, onSuccess: (data) {
     teamResponse = data;
    
     isLoading = true;
     update();
  }, onError: (e) {
    print(e);
  },);
}

///
/// 
///
void openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Không thể mở đường dẫn $url';
    }
}

}
