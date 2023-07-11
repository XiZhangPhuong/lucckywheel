import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/screen/football/football_con%20troller.dart';
import 'package:luckywheel/temp.dart';

class FootBallPage extends GetView<FootBallController> {
  const FootBallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: FootBallController(),
      builder: (FootBallController controller) {
        return Scaffold(
          backgroundColor: Color(0xff1a1a1a),
          appBar: controller.isLoading == false
              ? null
              : AppBar(
                  backgroundColor: Color(0xff1a1a1a),
                  elevation: 1,
                  title: Text(
                    controller.getArgu.last,
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                    tooltip: 'Back',
                  ),
                ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black12, Colors.blue.withOpacity(0.5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),),
            child: controller.isLoading == false
                ? Center(child: LoadingIndicator()) :  controller.compertitionResponse.matches!.isEmpty ? Center(
                  child: Text('Không có dữ liệu',style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                )
                : Container(
                    child: Column(
                      children: [
                        _listViewChon(controller),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: controller.click == true
                              ? _listViewLichThiDau(controller)
                              : _bangXepHang(controller),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  ///
  /// widget lich thi dau
  ///
  Widget _listViewLichThiDau(FootBallController controller) {
    return ListView.builder(
      itemCount: controller.compertitionResponse.matches!.length,
      itemBuilder: (context, index) {
        final item = controller.compertitionResponse.matches![index];
        return GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(
              bottom: 15,
            ),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1, color: Colors.white70)),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      controller.processImage1(
                          item.homeTeam!.crest!, 80, 150, LoadingIndicator()),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        item.homeTeam!.shortName!,
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        Temp.convertUtcToVietnamTime(
                          item.utcDate!,
                        ),
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        item.competition!.name!,
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      controller.processImage1(
                          item.awayTeam!.crest!, 80, 150, LoadingIndicator()),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        item.awayTeam!.shortName!,
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///
  /// listview chon
  ///
  Widget _listViewChon(FootBallController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // lịch thi đấu
        GestureDetector(
          onTap: () {
            controller.clickTabbar(true);
          },
          child: Container(
            width: Get.width / 2 - 15,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1,
                    color: controller.click == true
                        ? Colors.red.withOpacity(0.5)
                        : Colors.white70)),
            child: Center(
              child: Text(
                'Lịch thi đấu',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // bảng xếp hạng
        GestureDetector(
          onTap: () {
            controller.clickTabbar(false);
          },
          child: Container(
            width: Get.width / 2 - 15,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: controller.click == true
                    ? Colors.white70
                    : Colors.red.withOpacity(0.5),
              ),
            ),
            child: Center(
              child: Text(
                'Bảng xếp hạng',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///
/// Widget Bảng xếp hạng
///
Widget _bangXepHang(FootBallController controller) {
  List<DataRow> rows = []; // Danh sách các DataRow
  for (int i = 0; i < controller.stadingResponse.standings!.length; i++) {
    for (var item in controller.stadingResponse.standings![i].table!) {
      DataRow row = DataRow(cells: [
        DataCell(
          Text(
            (item.position!.toString()),
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              Flexible(
                child: controller.processImage1(
                    item.team!.crest!,30,30,                 
                    CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1,
                    ),),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                item.team!.shortName!,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            item.points!.toString(),
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            item.won!.toString(),
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            item.draw!.toString(),
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            item.lost!.toString(),
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ]);
      rows.add(row);
    }
  }
  return controller.isLoadingStanding == false
      ? LoadingIndicator()
      : Container(
          child: DataTable2(
            columns: [
              // Các cột của DataTable
              DataColumn2(
                  label: Text(' ',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 14,
                      )),
                  size: ColumnSize.S),
              DataColumn2(
                  label: Text(
                    'Câu lạc bộ',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  size: ColumnSize.L,
                  fixedWidth: 150),
              DataColumn2(
                  label: Text('P',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 14,
                      )),
                  size: ColumnSize.S),
              DataColumn2(
                  label: Text('W',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 14,
                      )),
                  size: ColumnSize.S),
              DataColumn2(
                  label: Text('H',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 14,
                      )),
                  size: ColumnSize.S),
              DataColumn2(
                  label: Text('L',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 14,
                      )),
                  size: ColumnSize.S),
            ],
            rows: rows,
            columnSpacing: 8,
            horizontalMargin: 12,
          ),
        );
}
