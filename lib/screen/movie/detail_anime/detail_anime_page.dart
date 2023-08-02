import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/screen/movie/detail_anime/detail_anime_controller.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailAnimePage extends GetView<DetailAnimeController> {
  const DetailAnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DetailAnimeController(),
      builder: (DetailAnimeController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          body: controller.isLoadingMovie == false
              ? LoadingIndicator()
              : SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                            'https://image.tmdb.org/t/p/original${controller.dataMovie['backdrop_path']}'),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  controller.dataMovie['title'],
                                  style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                Icons.favorite,
                                color: ColorResources.MAIN,
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            controller.dataMovie['overview'],
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
