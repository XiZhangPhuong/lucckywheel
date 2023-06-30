import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:luckywheel/model/nasa_response.dart';
import 'package:luckywheel/repository/nasa_repository.dart';

class NasaController extends GetxController{
  NasaResponse nasaResponse = NasaResponse();
  NasaRepository nasaRepository = NasaRepository();
  List<String> listNation = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    getNasaResponse();
    getAllNameTion();
  }

  ///
  /// void get nasa response
  ///
  Future<void> getNasaResponse() async {
     nasaRepository.getNasaResponse(onSucess: (data) {
        nasaResponse = data;
        isLoading = true;
        print(data.toMap());
        update();
     }, onError: (e) {
        print(e);
     },);
  }

  ///
  /// get all name nation
  ///
  Future<void> getAllNameTion() async {
    nasaRepository.getAllNameNation(onSucess: (data) {
      listNation = data;
      update();
      print(listNation.length.toString());
      for(var i in listNation){
        print(i);
      }
    }, onError: (e) {
      print(e);
    },);
  }
}