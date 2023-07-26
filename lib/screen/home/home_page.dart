import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/home/home_controller.dart';
import 'package:luckywheel/temp.dart';
import 'package:luckywheel/util/color_resources.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          appBar: controller.isLoadingScheDule == false
              ? null
              : _appBar(controller, context),
          body: controller.isLoadingScheDule == false
              ? LoadingIndicator()
              : Container(
                  padding: EdgeInsets.all(10.0),
                  // tabbar custom
                  child: ContainedTabBarView(
                    initialIndex: controller.selectTed,
                    onChange: (p0) {
                      controller.clickTabBar(p0);
                    },
                    tabBarProperties: TabBarProperties(
                      indicatorColor: ColorResources.MAIN,
                      alignment: TabBarAlignment.center,
                      isScrollable: true,
                    ),
                    tabs: [
                      Container(
                        width: Get.width / 3,
                        alignment: Alignment.center,
                        child: Text(
                          'Lịch thi đấu',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width / 3,
                        alignment: Alignment.center,
                        child: Text(
                          'Bảng xếp hạng',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width / 3,
                        alignment: Alignment.center,
                        child: Text(
                          'Top bàn thắng',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width / 3,
                        alignment: Alignment.center,
                        child: Text(
                          'Đội vô địch',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                    views: [
                      _scheDuLe(controller),
                      _bangXepHang(controller),
                      _topScore(controller),
                      _doiVoDich(controller),
                    ],
                  ),
                ),
        );
      },
    );
  }

  ///
  /// appBr
  ///
  AppBar _appBar(HomeController controller, BuildContext context) {
    return AppBar(
      backgroundColor: ColorResources.BACKGROUND,
      title: Text(
        Validate.nullOrEmpty(controller.teamName)
            ? '${controller.compertitionResponse.competition!.name!} ${controller.currentYear}'
            : '${controller.teamName} ${controller.currentYear}',
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      leading: Image.network(
        controller.compertitionResponse.competition!.emblem!,
        fit: BoxFit.cover,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            controller.showBottomSheetGetTeam();
          },
          child: Validate.nullOrEmpty(controller.logo)
              ? SvgPicture.network(
                  'https://crests.football-data.org/770.svg',
                  height: 18,
                  width: 18,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Temp.processImage1(
                    imageUrl: controller.logo,
                    height: 30,
                    widght: 30,
                    onLoading: Container(
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
        ),
        // popumenu button
        PopupMenuButton(
          initialValue: controller.currentYear,
          itemBuilder: (context) {
            return controller.listYear
                .map(
                  (e) => PopupMenuItem(
                    onTap: () {
                      controller.clickSearchYearch(e);
                    },
                    child: Text(
                      'Năm ${e}',
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: controller.currentYear == e
                              ? ColorResources.MAIN
                              : Colors.black),
                    ),
                  ),
                )
                .toList();
          },
        )
      ],
    );
  }
}

///
///  sche dule
///
Widget _scheDuLe(HomeController controller) {
  return Container(
    padding: EdgeInsets.only(top: 10),
    child: Validate.nullOrEmpty(controller.logo)
        ? _listViewFullScheDule(controller)
        : _listViewFullScheDuleByTeam(controller),
  );
}

///
/// lịch sử đấu toàn bộ của Ngoại Hạng Anh
///
Widget _listViewFullScheDule(HomeController controller) {
  return ListView.builder(
    //controller: controller.scrollControllerScheDule,
    shrinkWrap: true,
    itemCount: controller.compertitionResponse.matches!.length,
    itemBuilder: (context, index) {
      final item = controller.compertitionResponse.matches![index];
      return GestureDetector(
        onTap: () {
          print(item.id);
          controller.gotoMatchDetail(item.id!);
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(
              width: 1,
              color: controller.colorBorderListView(
                utcDay: Temp.convertUtcToVietnamTime(item.utcDate!),
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    controller.processImage1(
                      imageUrl: item.homeTeam!.crest!,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      item.homeTeam!.shortName!,
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
                    Text(
                      Temp.convertUtcToVietnamTime(
                        item.utcDate!,
                      ),
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    controller.notifiOrText(
                        status: item.status!,
                        finished: Validate.nullOrEmpty(
                                item.score!.fullTime!.home)
                            ? ''
                            : '${item.score!.fullTime!.home} : ${item.score!.fullTime!.away!}',
                        utcDate: item.utcDate!),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    controller.processImage1(
                      imageUrl: item.awayTeam!.crest!,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      item.awayTeam!.shortName!,
                      style: GoogleFonts.nunito(
                        fontSize: 14,
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
/// listview lịch thi đấu Ngoại Hạng Anh lọc theo đội tuyển
///
Widget _listViewFullScheDuleByTeam(HomeController controller) {
  return controller.isLoadingScheduleByTeam == false
      ? LoadingIndicator()
      : ListView.builder(
          shrinkWrap: true,
          itemCount: controller.dataScheDuleByteam['resultSet']['count'],
          itemBuilder: (context, index) {
            final item = controller.dataScheDuleByteam['matches'][index];
            return GestureDetector(
              onTap: () {
                print(item['id']);
                controller.gotoMatchDetail(item['id']);
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(
                      width: 1,
                      color: controller.colorBorderListView(
                          utcDay: item['utcDate']),),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          controller.processImage1(
                            imageUrl: item['homeTeam']['crest'].toString(),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            item['homeTeam']['shortName'].toString(),
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
                          Text(
                            Temp.convertUtcToVietnamTime(
                              item['utcDate'].toString(),
                            ),
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          controller.notifiOrText(
                              status: item['status'],
                              finished: Validate.nullOrEmpty(
                                      item['score']['fullTime']['home'])
                                  ? ''
                                  : '${item['score']['fullTime']['home']} : ${item['score']['fullTime']['away']}',
                              utcDate: item['utcDate']),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          controller.processImage1(
                            imageUrl: item['awayTeam']['crest'].toString(),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            item['awayTeam']['shortName'].toString(),
                            style: GoogleFonts.nunito(
                              fontSize: 14,
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
/// dropDowButton
///
Widget _searchVongDau(HomeController controller) {
  return Container(
    alignment: Alignment.centerRight,
    child: DropdownButton(
      value: controller.valueVongDau,
      underline: Container(),
      style: GoogleFonts.nunito(
        color: Colors.black,
      ),
      icon: Icon(
        Icons.arrow_drop_down_circle_outlined,
        color: Colors.white70,
        size: 20,
      ),
      items: controller.listVongDau
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  color:
                      e == controller.valueVongDau ? Colors.red : Colors.black,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        controller.clickDropDowButton(value!);
      },
    ),
  );
}

///
/// Widget Bảng xếp hạng
///
Widget _bangXepHang(HomeController controller) {
  List<DataRow> rows = []; // Danh sách các DataRow
  for (int i = 0; i < controller.stadingResponse.standings!.length; i++) {
    for (var item in controller.stadingResponse.standings![i].table!) {
      DataRow row = DataRow(onLongPress: () {}, cells: [
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
          onTap: () {
            controller.gotoTeamPage(item.team!.id!);
          },
          Row(
            children: [
              Flexible(
                child: controller.processImage1(
                    imageUrl: item.team!.crest!, height: 30, widght: 30),
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
                  label: Text(
                    ' ',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
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
                  label: Text(
                    'P',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  size: ColumnSize.S),
              DataColumn2(
                  label: Text(
                    'W',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  size: ColumnSize.S),
              DataColumn2(
                  label: Text(
                    'H',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  size: ColumnSize.S),
              DataColumn2(
                  label: Text(
                    'L',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  size: ColumnSize.S),
            ],
            rows: rows,
            columnSpacing: 8,
            horizontalMargin: 12,
          ),
        );
}

///
/// top score
///
Widget _topScore(HomeController controller) {
  // row
  List<DataRow> rows = [];
  for (int i = 0; i < controller.listTopScore.length; i++) {
    final item = controller.listTopScore[i];
    DataRow row = DataRow(cells: [
      DataCell(
        Text(
          (i + 1).toString(),
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      DataCell(
        onTap: () {},
        Text(
          item.player!.name!,
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      DataCell(
        onTap: () {},
        Row(
          children: [
            Flexible(
              child: controller.processImage1(
                  imageUrl: item.team!.crest!, height: 30, widght: 30),
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
            ),
          ],
        ),
      ),
      DataCell(
        Text(
          Validate.nullOrEmpty(item.goals) ? '0' : item.goals!.toString(),
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      DataCell(
        Text(
          Validate.nullOrEmpty(item.assists) ? '0' : item.assists!.toString(),
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      DataCell(
        Text(
          Validate.nullOrEmpty(item.penalties)
              ? '0'
              : item.penalties!.toString(),
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    ]);
    rows.add(row);
  }

  return controller.isLoadingTopScore == false
      ? LoadingIndicator()
      : controller.listTopScore.isEmpty
          ? Center(
              child: Text(
                'Chưa có dữ liệu',
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            )
          : Container(
              child: DataTable2(
                // scrollController: controller.scrollControllerTopScore,
                columns: [
                  // Các cột của DataTable
                  DataColumn2(
                      label: Text(
                        ' ',
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      size: ColumnSize.M),
                  DataColumn2(
                    label: GestureDetector(
                      onTap: () {
                        controller.limitTopScore += 10;
                        controller.getTopScore();
                      },
                      child: Text(
                        'Cầu thủ',
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    size: ColumnSize.L,
                    fixedWidth: 100,
                  ),
                  DataColumn2(
                    label: Text(
                      'Câu lạc bộ',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    size: ColumnSize.L,
                    fixedWidth: 130,
                  ),
                  DataColumn2(
                    label: Text(
                      'G',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    size: ColumnSize.M,
                  ),
                  DataColumn2(
                      label: Text(
                        'A',
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      size: ColumnSize.M),
                  DataColumn2(
                      label: Text(
                        'P',
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      size: ColumnSize.M),
                ],
                rows: rows,
                columnSpacing: 8,
                horizontalMargin: 0,
              ),
            );
}

///
/// đội vô địch theo mùa
///
Widget _doiVoDichTheoMua(HomeController controller) {
  return Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Mùa giải',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              'Câu lạc bộ',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                controller.listChamion.length,
                (index) => Validate.nullOrEmpty(
                        controller.listChamion[index]['winner'])
                    ? Container()
                    : Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${controller.listChamion[index]['startDate']}' +
                                      '\n' +
                                      '${controller.listChamion[index]['endDate']}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      controller.processImage1(
                                          imageUrl: controller
                                              .listChamion[index]['winner']
                                                  ['crest']
                                              .toString(),
                                          height: 30,
                                          widght: 30),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller.listChamion[index]['winner']
                                            ['shortName'],
                                        style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

///
/// đội vô địch theo mùa
///
Widget _doiVoDich(HomeController controller) {
  List<DataRow> rows = [];
  for (int i = 0; i < controller.listChamion.length; i++) {
    final item = controller.listChamion[i];
    bool checkWinner = Validate.nullOrEmpty(item['winner']);
    DataRow row = DataRow(cells: [
      DataCell(
        Text(
          '${controller.listChamion[i]['startDate']}',
          textAlign: TextAlign.center,
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
              child: checkWinner
                  ? Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white70,
                      ),
                      child: Image.network(
                        controller.compertitionResponse.competition!.emblem!,
                        height: 30,
                        width: 30,
                      ),
                    )
                  : controller.processImage1(
                      imageUrl: controller.listChamion[i]['winner']['crest'],
                      height: 30,
                      widght: 30),
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              checkWinner
                  ? 'No data'
                  : controller.listChamion[i]['winner']['shortName'],
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      DataCell(
        Row(
          children: [
            Icon(
              Icons.lightbulb,
              color: Colors.white,
            ),
            Text(
              checkWinner
                  ? '.......'
                  : controller.listChamion[i]['winner']['founded'].toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ]);
    rows.add(row);
  }

  return controller.isLoadingChampion == false
      ? LoadingIndicator()
      : Container(
          child: DataTable2(
            columns: [
              // Các cột của DataTable
              DataColumn2(
                label: Text(
                  'Mùa giải',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                size: ColumnSize.M,
                // fixedWidth: Get.width/2,
              ),
              DataColumn2(
                label: Text(
                  'Câu lạc bộ',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                size: ColumnSize.L,
                // fixedWidth: Get.width/2,
              ),
              DataColumn2(
                label: Text(
                  'Thành lập',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                size: ColumnSize.M,
                // fixedWidth: Get.width/2,
              ),
            ],
            rows: rows,
            columnSpacing: 8,
            horizontalMargin: 0,
          ),
        );
}

///
/// thông báo hoặc tỉ số
///
Widget _thongBaoHoacTiSo() {
  return Container(
    padding: EdgeInsets.all(10.0),
  );
}
