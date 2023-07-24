import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/team/team_controller.dart';
import 'package:luckywheel/temp.dart';
import 'package:luckywheel/util/color_resources.dart';

class TeamPage extends GetView<TeamController> {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TeamController(),
      builder: (TeamController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          appBar: controller.isLoading == false
              ? null
              : AppBar(
                  backgroundColor: ColorResources.BACKGROUND,
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  centerTitle: true,
                  actions: [
                    SvgPicture.network(
                      controller.teamResponse.area!.flag!,
                      height: 18,
                      width: 18,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                  title: Row(
                    children: [
                      Image.network(
                        controller.teamResponse.crest!,
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        controller.teamResponse.shortName!,
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
          body: controller.isLoading == false
              ? LoadingIndicator()
              : ContainedTabBarView(
                  tabBarProperties: TabBarProperties(
                    indicatorColor: ColorResources.MAIN,
                    alignment: TabBarAlignment.center,
                    // isScrollable: true,
                  ),
                  tabs: [
                      Container(
                        width: Get.width / 3,
                        alignment: Alignment.center,
                        child: Text(
                          'Thông tin',
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
                          'Đội hình',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  views: [
                      _thongTinTeam(controller),
                      _forMation(controller),
                    ]),
        );
      },
    );
  }

  ///
  ///
  ///
  CustomScrollView _customScrrollView(TeamController controller) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // title: Text('ManCity'),
          floating: true,
          pinned: true,
          expandedHeight: Get.height / 5,

          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(left: 60.0, bottom: 16.0),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Le Thi Thu Phuong',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          // centerTitle: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100.0,
                child: Center(
                  child: Text('$index', textScaleFactor: 5),
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}

///
/// custom appbar
///
Widget _customAppBar(TeamController controller) {
  return Container(
    height: 200,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_off,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        ListTile(
          leading: Image.network(
            'https://crests.football-data.org/65.png',
            height: 100,
            width: 100,
          ),
          title: Text(
            'Mancity',
            style: GoogleFonts.nunito(
              color: ColorResources.BACKGROUND,
              fontSize: 18,
            ),
          ),
          subtitle: Text('ManCity.com'),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Temp.processImage1(
              imageUrl: 'https://crests.football-data.org/770.svg',
              height: 15,
              widght: 15,
              onLoading: CircularProgressIndicator(),
            ),
            SizedBox(
              width: 5,
            ),
            Text('Anh'),
          ],
        )
      ],
    ),
  );
}

///
/// doi hinh
///
Widget _forMation(TeamController controller) {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Huấn luyện viên',
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          _itemContainer(
              name: Validate.nullOrEmpty(controller.teamResponse.coach!.name)
                  ? 'Chưa có'
                  : controller.teamResponse.coach!.name!,
              nation: Validate.nullOrEmpty(
                      controller.teamResponse.coach!.nationality)
                  ? 'Chưa có'
                  : controller.teamResponse.coach!.nationality!),
          SizedBox(
            height: 5,
          ),
          Text(
            'Thủ môn',
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          // danh sách thủ môn
          Column(
            children: List.generate(
              controller.teamResponse.squad!
                  .where((element) => element.position == 'Goalkeeper')
                  .toList()
                  .length,
              (index) => Column(
                children: [
                  if (controller.teamResponse.squad![index].position ==
                      'Goalkeeper')
                    _itemContainer(
                        name: controller.teamResponse.squad![index].name!,
                        nation:
                            controller.teamResponse.squad![index].nationality!),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Cầu thủ',
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          // danh sách phòng thủ
          // Column(
          //   children: List.generate(
          //     controller.teamResponse.squad!
          //         .where((element) => element.position == 'Offence')
          //         .toList()
          //         .length,
          //     (index) => Column(
          //       children: [
          //         if (controller.teamResponse.squad![index].position ==
          //             'Offence')
          //           _itemContainer(
          //               name: controller.teamResponse.squad![index].name!,
          //               nation:
          //                   controller.teamResponse.squad![index].nationality!),
          //       ],
          //     ),
          //   ),
          // ),
          Column(
            children: List.generate(
              controller.teamResponse.squad!.length,
              (index) => Column(
                children: [
                  _itemContainer(
                      name: controller.teamResponse.squad![index].name!,
                      nation:
                          controller.teamResponse.squad![index].nationality!),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

///
/// widger item
///
Widget _itemContainer({required String name, required String nation}) {
  return Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 0.7, color: Colors.white70),
    ),
    child: Row(
      children: [
        Text(
          '${name} | Quốc tịch : ${nation}',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

///
/// in danh sách thủ môn
///
Widget _danhSachThuMon(TeamController controller) {
  List<Widget> listItemThuMon = [];
  for (int i = 0; i < controller.teamResponse.squad!.length; i++) {
    final item = controller.teamResponse.squad![i];
    if (item.position == 'Goalkeeper') {
      return Column(
        children: List.generate(
          controller.teamResponse.squad!.length,
          (index) =>
              _itemContainer(name: item.name!, nation: item.nationality!),
        ),
      );
    }
  }
  return Container();
}

///
/// thông tin team
///
Widget _thongTinTeam(TeamController controller) {
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.only(
      top: 15,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Sân vận động : ',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Expanded(
              child: Text(
                controller.teamResponse.venue!,
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              'Địa chỉ : ',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Expanded(
              child: Text(
                Validate.nullOrEmpty(controller.teamResponse.address)
                    ? ''
                    : controller.teamResponse.address!,
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              'Năm thành lập : ',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Text(
              Validate.nullOrEmpty(controller.teamResponse.founded)
                  ? ''
                  : controller.teamResponse.founded!.toString(),
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              'Màu CLB : ',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Text(
              Validate.nullOrEmpty(controller.teamResponse.clubColors)
                  ? ''
                  : controller.teamResponse.clubColors!.toString(),
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),

         SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              'Website : ',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            GestureDetector(
              
              onTap: () {
              //  controller.openURL(controller.teamResponse.website!);
              },
              child: Text(
                Validate.nullOrEmpty(controller.teamResponse.website)
                    ? ''
                    : controller.teamResponse.website!,
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 2,
          color: ColorResources.MAIN,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Các giải đấu : ',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment:
              controller.teamResponse.runningCompetitions!.length == 1
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceAround,
          children: List.generate(
              controller.teamResponse.runningCompetitions!.length,
              (index) => Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Validate.nullOrEmpty(controller.teamResponse
                                  .runningCompetitions![index].emblem)
                              ? Container(
                                  height: 60,
                                  width: 60,
                                  child: Center(
                                    child: Icon(
                                      Icons.follow_the_signs_sharp,
                                      color: ColorResources.BACKGROUND,
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    Validate.nullOrEmpty(controller.teamResponse
                                            .runningCompetitions![index].emblem)
                                        ? controller.teamResponse.crest!
                                        : controller
                                            .teamResponse
                                            .runningCompetitions![index]
                                            .emblem!,
                                    height: 60,
                                    width: 60,
                                  ),
                                )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Validate.nullOrEmpty(controller
                                .teamResponse.runningCompetitions![index].name)
                            ? ''
                            : controller
                                .teamResponse.runningCompetitions![index].name!,
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
        )
      ],
    ),
  );
}
