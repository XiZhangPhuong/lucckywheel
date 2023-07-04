import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:luckywheel/model/nasa_response.dart';
import 'package:luckywheel/repository/nasa_repository.dart';
import 'package:intl/intl.dart';

class NasaController extends GetxController {
  NasaResponse nasaResponse = NasaResponse();
  NasaRepository nasaRepository = NasaRepository();
  List<String> listNation = [];
  bool isLoading = false;
  DateTime? selectedDate;

  @override
  void onInit() {
    super.onInit();
    getNasaResponse();
    // getAllNameTion();
  }

  ///
  /// void get nasa response
  ///
  Future<void> getNasaResponse()  async {
    nasaRepository.getNasaResponse(
      onSucess: (data) {
        nasaResponse = data;
        isLoading = true;
        print(data.toMap());
        update();
      },
      onError: (e) {
        isLoading = true;
        print(e);
      },
    );
  }

  ///
  /// void get nasa response click
  ///
  Future<void> getNasaResponseClick() async {
    nasaRepository.getNasaResponse(
      date: convertDateToString(selectedDate!),
      onSucess: (data) {
        nasaResponse = data;
        isLoading = true;
        print(data.toMap());
        update();
      },
      onError: (e) {
        isLoading = true;
        print(e);
      },
    );
  }

  ///
  /// get all name nation
  ///
  Future<void> getAllNameTion() async {
    nasaRepository.getAllNameNation(
      onSucess: (data) {
        listNation = data;
        update();
        print(listNation.length.toString());
        for (var i in listNation) {
          print(i);
        }
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// click date time
  ///
  void clickDatetime(DateTime dateTime) {
    if (dateTime.isBefore(DateTime.now()) ||
        dateTime.isAtSameMomentAs(DateTime.now())) {
      selectedDate = dateTime;
      getNasaResponseClick();
      print(selectedDate);
      update();
    }
  }
}

///
/// dat time to String (yyyy/MM/dd)
///
String convertDateToString(DateTime time) {
  String formattedDate = DateFormat('yyyy-MM-dd').format(time);
  return formattedDate;
}
