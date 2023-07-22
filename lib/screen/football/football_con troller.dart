import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/model/football/competitions_response.dart';
import 'package:luckywheel/model/football/stading_response.dart';
import 'package:luckywheel/repository/footballl_repository.dart';

class FootBallController extends GetxController {
  FoodBallRespository footBallRespository = FoodBallRespository();
  CompetitionsResponse compertitionResponse = CompetitionsResponse();
  bool isLoading = false;
  bool isLoadingStanding = false;
  bool click = true;
  StadingResponse stadingResponse = StadingResponse();
  final getArgu = Get.arguments as List<dynamic>;

  @override
  void onInit() {
    super.onInit();

    getAll();
    getStanDing();
  }

  ///
  /// onClickTabbar
  ///
  void clickTabbar(bool value) {
    click = value;
    update();
  }

  ///
  /// Gọi tất cả các trận đấu sắp diễn ra ở Ngoại Hạng Anh
  ///
  Future<void> getAll() async {
    await footBallRespository.getAllScheDuledPL(
      season: '2023',
      onSuccess: (data) {
        compertitionResponse = data;
        isLoading = true;
        update();
        print(compertitionResponse.toMap());
      },
      onError: (e) {
        print(e);
      },
      code: getArgu.first,
    );
  }

  ///
  /// thống kê bảng xếp hạng
  ///
  Future<void> getStanDing() async {
    await footBallRespository.getStanding(
      season: '2023',
      code: getArgu.first,
      onSuccess: (data) {
        stadingResponse = data;
        isLoadingStanding = true;
        print(stadingResponse.toMap());
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// xử lí hình ảnh
  ///
  Widget processImage1(
      String imageUrl, double? height, double? widght, Widget? onLoading) {
    final String extension = imageUrl.substring(imageUrl.length - 3);

    if (extension.toLowerCase() == 'png') {
      String svgUrl = imageUrl.replaceAll('.png', '.svg');
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SvgPicture.network(
          svgUrl,
          height: height ?? 80,
          width: widght ?? 150,
          placeholderBuilder: (BuildContext context) =>
              onLoading ?? LoadingIndicator(),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SvgPicture.network(
          imageUrl,
          height: height ?? 80,
          width: widght ?? 150,
          placeholderBuilder: (BuildContext context) =>
              onLoading ?? LoadingIndicator(),
        ),
      );
    }
  }
}
