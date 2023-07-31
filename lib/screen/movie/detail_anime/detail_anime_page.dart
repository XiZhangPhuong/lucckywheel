import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/screen/movie/detail_anime/detail_anime_controller.dart';
import 'package:luckywheel/util/color_resources.dart';

class DetailAnimePage extends GetView<DetailAnimeController> {
  const DetailAnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DetailAnimeController(),
      builder: (DetailAnimeController controller) {
        return Scaffold(
          backgroundColor: ColorResources.BACKGROUND,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  controller.data['image'],
                  height: Get.height * 0.35,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          controller.data['title'],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline,
                          color: ColorResources.MAIN,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                ),
       
                Divider(color: Colors.white70.withOpacity(0.5),),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child:  Text(
                        controller.data['synopsis'],
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 14,
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
}
