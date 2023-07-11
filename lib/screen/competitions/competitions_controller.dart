import 'package:get/get.dart';
import 'package:luckywheel/model/football/cacgiaidau_response.dart';
import 'package:luckywheel/repository/footballl_repository.dart';

class CompetitionsController extends GetxController{
  final FoodBallRespository _foodBallRespository = FoodBallRespository();
  bool isLoading = false;
  List<CacGiaiDauResponse> listData = [];
  
  @override
  void onInit() {
   
    super.onInit();
    getAllCompetition();
  }

  ///
  /// get giải đấu lớn trên thế giới
  ///
  Future<void> getAllCompetition() async {
   await _foodBallRespository.getCompetition(
    onSuccess: (data) {
      listData = data;
      isLoading = true;
      update();
    },
    onError: (e) {
      print(e);
    },
   );
  }
}