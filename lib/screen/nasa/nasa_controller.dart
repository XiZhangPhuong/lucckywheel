import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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
  RxBool isSpeak = false.obs;
  final FlutterTts flutterTts = FlutterTts();
 

  @override
  void onInit() {
    super.onInit();
    getNasaResponse();
    
  }

   @override
  void onClose() {
    super.onClose();
    flutterTts.stop();
    
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
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// click speak
  ///

  Future<void> speakText({required String text}) async {
    print("Bắt đầu phát âm thanh: $text");
    await flutterTts.setLanguage('en-ES'); // Đặt ngôn ngữ là tiếng Anh
    await flutterTts.setSpeechRate(
        0.5); // Đặt tốc độ phát giọng (1.0 là tốc độ bình thường)
    await flutterTts.setVolume(0.5);
    await flutterTts.speak(text); // Phát giọng cho đoạn văn bản
    print("Kết thúc phát âm thanh:$text");
  }


   ///
  /// click button player
  ///
  Future<void> clickButtonVolume({required String text}) async {
    if (isSpeak.value) {
      isSpeak.value = false;
      flutterTts.stop();
      update();
    } else {
      isSpeak.value = true;
      speakText(text: text);
      update();
    }
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



