import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/screen/anime/anime_controller.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AnimePage extends GetView<AnimeController> {
  const AnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AnimeController(),
      builder: (AnimeController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          appBar: _appBar(),
          body:controller.isLoading==false? LoadingIndicator()  :  Container(
            padding: EdgeInsets.all(10.0),
            child: SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onLoading: () {
                controller.onLoading();
              },
              onRefresh: () {
                controller.onRefreshing();
              },
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: controller.listAnime.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemBuilder: (context, index) {
                  final item  = controller.listAnime[index];
                  return GestureDetector(
                    onTap: () {
                      print(item['_id']);
                      controller.showBottomSheet(url: item['link']);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Validate.nullOrEmpty(item['image']) ? Container() :
                              Image.network(item['image'],
                              fit: BoxFit.cover,
                              width: Get.width/3,),
                              
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(Validate.nullOrEmpty(item['title']) ?'No name' :
                          item['title'],style: GoogleFonts.nunito(
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

///
/// appBar
///
AppBar _appBar() {
  return AppBar(
    backgroundColor: ColorResources.BACKGROUND,
    title: Text(
      'List Anime',
      style: GoogleFonts.nunito(
        fontSize: 20,
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
          Icons.notifications_outlined,
          color: Colors.white,
        ),
      ),
    ],
  );
}
