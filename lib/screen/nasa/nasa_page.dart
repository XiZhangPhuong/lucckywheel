import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/base_image.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/nasa/nasa_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';

class NasaPage extends GetView<NasaController> {
  const NasaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NasaController(),
      builder: (NasaController controller) {
        return Scaffold(
          // appBar: _appBar(),
          backgroundColor: Color(0xff1a1a1a),
          body: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.velocity.pixelsPerSecond.dx > 1000) {
                Get.back();
              } else if (details.velocity.pixelsPerSecond.dx < -1000) {
                Get.back();
              }
            },
            child: SafeArea(
              child: Container(
                height: Get.height,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black12, Colors.blue.withOpacity(0.5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: controller.isLoading == false
                    ? LoadingIndicator()
                    : _hinhAnhThienVan(controller),
              ),
            ),
          ),
        );
      },
    );
  }

  ///
  /// appBar
  ///
  AppBar _appBar() {
    return AppBar(
      backgroundColor: Color(0xff1a1a1a),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
        tooltip: 'Back',
      ),
    );
  }

  ///
  /// hinh anh thien van
  ///
  Widget _hinhAnhThienVan(NasaController controller) {
    return RefreshIndicator(
      backgroundColor: Colors.black38,
      color: Colors.white,
      onRefresh: () async {},
      child: SingleChildScrollView(
        child: Column(children: [
          _dateTime(controller),
          SizedBox(
            height: 10,
          ),
          Text(controller.nasaResponse.title!,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: 20,
                color: Colors.white,
              )),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: PhuongImage(url: controller.nasaResponse.url!)
          ),
         // button volume
          AnimatedContainer(
            duration: Duration(seconds: 500),
            child: Container(
              alignment: Alignment.centerRight,
              child: IconButton(onPressed: () {
                controller.clickButtonVolume(text: controller.nasaResponse.explanation!);
              }, icon: Icon(Icons.volume_up,color: Colors.white,),),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              controller.nasaResponse.explanation!,
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

///
/// custom dateTime
///
Widget _dateTime(NasaController controller) {
  DateTime currentDate = DateTime.now();
  List<DateTime> validDates = [];
  int numOfDaysToShow = 10; // Số ngày muốn hiển thị

  // Thêm ngày hiện tại và các ngày quá khứ vào danh sách validDates
  for (int i = numOfDaysToShow - 1; i >= 0; i--) {
    DateTime date = currentDate.subtract(Duration(days: i));
    validDates.add(date);
  }

  return DatePicker(
    validDates.first,
    initialSelectedDate: currentDate,
    // selectionColor: const Color.fromRGBO(16, 32, 56, 1),
    selectedTextColor: Colors.white,
    locale: 'vi_VN',
    daysCount: validDates.length,
    dateTextStyle:
        GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600),
    onDateChange: (selectedDate) {
      controller.clickDatetime(selectedDate);
    },
  );
}
