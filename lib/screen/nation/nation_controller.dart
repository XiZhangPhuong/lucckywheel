import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/model/nation_response.dart';
import 'package:luckywheel/repository/nation_respository.dart';

class NationController extends GetxController {
  List<NationResponse> listNation = [];
  bool isLoading = false;
  NationRespository _nationRespotory = NationRespository();
  ScrollController? scrollController;
  RxBool showFloatingButton = false.obs;
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController!.addListener(_onScroll);
    getNation();
   // scrollToBottom();
  }

  @override
  void onClose() {
    scrollController!.removeListener(() {
      _onScroll();
    });
    scrollController!.dispose();
    super.onClose();
  }

  ///
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
  /// _onScroll
  ///
  void _onScroll() {
    if (scrollController!.position.pixels >= 200) {
      showFloatingButton.value = true;
    } else {
      showFloatingButton.value = false;
    }
  }

  ///
  /// scroll to bottom
  ///
  void scrollToBottom() {
    if(scrollController!=null){
      scrollController!.animateTo(scrollController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  ///
  ///
  ///
  Future<void> getNation() async {
    _nationRespotory.getAllNameNation(
      onSucess: (data) {
        listNation = data;
        listNation.sort(
          (a, b) {
            return b.population!.compareTo(a.population!);
          },
        );
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// format populationb
  ///

  String formatNumber(int number) {
    String str = number.toString(); // Chuyển đổi số nguyên thành chuỗi

    // Kiểm tra độ dài chuỗi để xác định vị trí chèn dấu chấm
    if (str.length <= 3) {
      return str; // Trả về chuỗi ban đầu nếu độ dài <= 3
    } else {
      // Tạo một danh sách các nhóm 3 chữ số từ phải sang trái
      List<String> groups = [];
      int startIndex = str.length % 3 == 0 ? 3 : str.length % 3;
      groups.add(str.substring(0, startIndex));

      for (int i = startIndex; i < str.length; i += 3) {
        groups.add(str.substring(i, i + 3));
      }

      // Kết hợp các nhóm chữ số bằng dấu chấm
      return groups.join('.');
    }
  }

  ///
  /// show bottmSheet
  ///
  void showBottom({
    required NationResponse nationResponse,
  }) {
    double screenHeight = Get.height;
    Get.bottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      Container(
        height: screenHeight * 0.8,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black12, Colors.black38],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Validate.nullOrEmpty(nationResponse.name!.common)
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    child: Text(
                      nationResponse.name!.common!,
                      style: GoogleFonts.nunito(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(7.0),
            //   child: Image.network(
            //     nationResponse.flags!.png!,

            //   ),
            // ),
            Validate.nullOrEmpty(nationResponse.name!.official)
                ? Container()
                : Text(
                    'Official: ' + nationResponse.name!.official!,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
            SizedBox(
              height: 5,
            ),
            Validate.nullOrEmpty(nationResponse.population)
                ? Container()
                : Text(
                    'Polulation: ' +
                        formatNumber(nationResponse.population!) +
                        ' people',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
            SizedBox(
              height: 5,
            ),
            Validate.nullOrEmpty(nationResponse.region)
                ? Container()
                : Text(
                    nationResponse.region!.isEmpty
                        ? '...'
                        : 'Region: ' + nationResponse.region!,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
            SizedBox(
              height: 5,
            ),
            Validate.nullOrEmpty(nationResponse.subregion)
                ? Container()
                : Text(
                    nationResponse.subregion!.isEmpty
                        ? '...'
                        : 'Subregion: ' + nationResponse.subregion!,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
            SizedBox(
              height: 5,
            ),
            Validate.nullOrEmpty(nationResponse.capital)
                ? Container()
                : Text(
                    nationResponse.capital!.isEmpty ||
                            nationResponse.capital == null
                        ? '...'
                        : 'Capital: ' + nationResponse.capital!.join(','),
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
            SizedBox(
              height: 5,
            ),
            Validate.nullOrEmpty(nationResponse.fifa)
                ? Container()
                : Text(
                    nationResponse.fifa!.isEmpty
                        ? '...'
                        : 'Fifa: ' + nationResponse.fifa!,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
            SizedBox(
              height: 5,
            ),
            Validate.nullOrEmpty(nationResponse.timezones)
                ? Container()
                : Text(
                    nationResponse.timezones!.isEmpty
                        ? '...'
                        : 'Timezones: ' + nationResponse.timezones!.join(','),
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
            SizedBox(
              height: 5,
            ),
            Validate.nullOrEmpty(nationResponse.borders)
                ? Container()
                : Text(
                    nationResponse.borders!.isEmpty
                        ? '...'
                        : 'Borders: ' + nationResponse.borders!.join(','),
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Validate.nullOrEmpty(nationResponse.flags!.png)
                    ? Container()
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          nationResponse.flags!.png!,
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                Validate.nullOrEmpty(nationResponse.coatOfArms!.png)
                    ? Container()
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          nationResponse.coatOfArms!.png!,
                          width: 120,
                          height: 100,
                          // fit: BoxFit.cover,
                        ),
                      ),
              ],
            ),
            SizedBox(height: 10),
            Validate.nullOrEmpty(nationResponse.flags!.alt)
                ? Container()
                : Text(
                    nationResponse.flags!.alt!,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
          ],
        )),
      ),
    );
  }
}
