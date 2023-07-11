import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:luckywheel/model/techtransfer_response.dart';
import 'package:luckywheel/repository/techtranfer_respository.dart';

class techTransFerController extends GetxController {
  final TechTranferRespository _techTranferRespository =
      TechTranferRespository();
  TechTransFerResponse techTransFerResponse = TechTransFerResponse();
  bool isLoading = false;
  PageController pageControler = PageController();
  int currenIndex = 0;
  RxBool isSpeak = false.obs;
  final FlutterTts flutterTts = FlutterTts();

  ///
  /// onChanGePage
  ///
  void nextPage(int max) {
    isSpeak.value = false;
    final nextPage = pageControler.page!.toInt() + 1;
    final maxPage = max;
    
    if (nextPage < maxPage) {
      pageControler.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      flutterTts.stop();
    } else {
      pageControler.jumpToPage(0);
      flutterTts.stop();
    }
  }

  ///
  /// get
  ///
  Future<void> getTranFer() async {
    _techTranferRespository.getTranFer(
      onSucess: (data) {
        techTransFerResponse = data;
        isLoading = true;
        update();
        print(data.results!.length.toString());
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
 /// showToast
 ///
 void showMess({required String text}){
    Get.snackbar('', text,
    backgroundColor: Colors.black.withOpacity(0.6),
    colorText: Colors.white,
    
    );
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

  @override
  void onInit() {
    super.onInit();
    getTranFer();
  }

  @override
  void onClose() {
    pageControler.dispose();
    flutterTts.stop();
    super.onClose();
  }
}
