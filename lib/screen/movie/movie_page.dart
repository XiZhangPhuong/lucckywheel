import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/movie/movie_controller.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MoviePage extends GetView<MovieController> {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MovieController(),
      builder: (MovieController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          appBar: _appBar(),
          body: controller.isLoading == false
              ? LoadingIndicator()
              : Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _slideImage(controller),
                      SizedBox(
                        height: 15,
                      ),
                      // tabbar
                      _tabBar(controller),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SmartRefresher(
                          controller: controller.scrollController,
                          enablePullDown: true,
                          enablePullUp: true,
                          onLoading: () {
                            controller.onLoading();
                          },
                          onRefresh: () {
                            controller.onRefreshing();
                          },
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: controller.listAnime.length,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 5,
                                ),
                                itemBuilder: (context, index) {
                                  final item = controller.listAnime[index];
                                  return GestureDetector(
                                    onTap: () {
                                      // controller.gotoDetailAnime(sentData: item);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                            child: Image.network(
                                              Validate.nullOrEmpty(item['image'])
                                                  ? ''
                                                  : item['image'],
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          Validate.nullOrEmpty(item['title'])
                                              ? ''
                                              : item['title'],
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.nunito(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
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
  /// tabbar
  ///
  Widget _tabBar(MovieController controller) {
    return Container(
      height: 55,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.listGenre.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.changeTabBar(
                  index: index, gend: controller.listGenre[index]['_id']);
              print(controller.listGenre[index]['_id']);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              margin: EdgeInsets.only(
                right: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: controller.currenIndex == index
                    ? ColorResources.MAIN
                    : ColorResources.BACKGROUND,
                border: controller.currenIndex == index
                    ? null
                    : Border.all(width: 1, color: ColorResources.MAIN),
              ),
              child: Center(
                child: Text(
                  controller.listGenre[index]['_id'],
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: controller.currenIndex == index
                        ? FontWeight.w600
                        : null,
                    color: controller.currenIndex == index
                        ? Colors.white
                        : ColorResources.MAIN,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  ///
  ///
  Container _listViewAnime(MovieController controller) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.listGenre.length,
        itemBuilder: (context, index1) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.listGenre[index1]['_id'],
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: controller.listAnime.length,
                  itemBuilder: (context, index) {
                    final item = controller.listAnime[index];
                    return GestureDetector(
                      onTap: () {
                        print(item['_id']);
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.only(
                          right: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(7.0),
                              child: Image.network(
                                Validate.nullOrEmpty(item['image'])
                                    ? ''
                                    : item['image'],
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              Validate.nullOrEmpty(item['title'])
                                  ? ''
                                  : item['title'],
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }

  ///
  /// item ListView
  ///
  Widget _itemListView(MovieController controller) {
    return Container(
      height: 300,
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.listAnime.length,
        itemBuilder: (context, index) {
          final item = controller.listAnime[index];
          return GestureDetector(
            onTap: () {
              print(item['_id']);
            },
            child: Container(
              width: 200,
              margin: EdgeInsets.only(
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7.0),
                    child: Image.network(
                      Validate.nullOrEmpty(item['image']) ? '' : item['image'],
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    Validate.nullOrEmpty(item['title']) ? '' : item['title'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  /// slide iamge
  ///
  Widget _slideImage(MovieController controller) {
    return CarouselSlider(
      items: controller.listImage.map((e) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image.network(
              e,
              height: 200,
              width: Get.width,
              fit: BoxFit.cover,
            ));
      }).toList(),
      options: CarouselOptions(
        aspectRatio: 2,
        autoPlay: true,
        enlargeCenterPage: true,
        disableCenter: true,
      ),
    );
  }

  ///
  /// appBar
  ///
  AppBar _appBar() {
    return AppBar(
      backgroundColor: ColorResources.BACKGROUND,
      title: Text(
        'Anime DB 2023',
        style: GoogleFonts.nunito(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
