import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:luckywheel/model/techport_response.dart';
import 'package:luckywheel/repository/techport_respository.dart';

class TechPortController extends GetxController {
  bool isLoading = false;
  bool isScrool = false;
  final FlutterTts flutterTts = FlutterTts();
  TechPortResponse techPortResponse = TechPortResponse();
  TechPortRepository _techPortRepository = TechPortRepository();
  ScrollController? scrollController;
  RxBool showFloatingButton = false.obs;
  RxBool isSpeak = false.obs;
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController!.addListener(_onScroll);
    getTechPort();
  }

  @override
  void onClose() {
    scrollController!.removeListener(() {
      _onScroll();
    });
    scrollController!.dispose();
    flutterTts.stop(); // dừng âm thanh khi back
    super.onClose();
  }

  ///
  /// _onScroll
  ///
  void _onScroll() {
    if (scrollController!.position.pixels >= 200) {
      showFloatingButton.value = true;
    } else {
      showFloatingButton.value = false;
    }
  }

//
  /// scroll to top
  ///
  void scrollToTop() {
    scrollController!.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  ///
  /// scroll to bottom
  ///
  void scrollToBottom({double pixelsPerSecond = 25.0}) {
    if (scrollController != null && scrollController!.hasClients) {
      final double maxScrollExtent = scrollController!.position.maxScrollExtent;
      final double distance =
          maxScrollExtent - scrollController!.position.pixels;
      final int durationInMilliseconds =
          (distance / pixelsPerSecond * 1000).round();
      scrollController!.animateTo(
        maxScrollExtent,
        duration: Duration(milliseconds: durationInMilliseconds),
        curve: Curves.easeInOut,
      );
      // Sau khi cuộn xong, đặt trạng thái cuộn về true
      scrollController!.position.addListener(() {
        if (scrollController!.position.pixels == maxScrollExtent) {
          isScrool = false;
          update();
        } else {
          isScrool = true;
          update();
        }
      });
    }
  }

  ///
  /// get techPort
  ///
  Future<void> getTechPort() async {
    await _techPortRepository.getTechPort(
      onSucess: (data) {
        techPortResponse = data;
        isLoading = true;
        update();
        print(techPortResponse.toMap());
      },
      onError: (e) {
        print(e);
      },
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

  ///
  /// speak text
  ///
  Future<void> speakText({required String text}) async {
    print("Bắt đầu phát âm thanh: $text");
    await flutterTts.setLanguage('en-ES'); // Đặt ngôn ngữ là tiếng Anh
    await flutterTts.setSpeechRate(
        0.5); // Đặt tốc độ phát giọng (1.0 là tốc độ bình thường)
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text); // Phát giọng cho đoạn văn bản
    print("Kết thúc phát âm thanh:$text");
  }

  ///
  ///
  ///
}
