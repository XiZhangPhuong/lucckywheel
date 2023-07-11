import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/routes/routes_path/home_routes.dart';
import 'package:luckywheel/screen/competitions/competitions_controller.dart';

class CompetitionPage extends GetView<CompetitionsController> {
  const CompetitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CompetitionsController(),
      builder: (CompetitionsController controller) {
        return Scaffold(
           // backgroundColor: Color(0xff1a1a1a),
          appBar: AppBar(
            title: Text('Các giải đấu thế giới'),
          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //       colors: [Colors.black12, Colors.blue.withOpacity(0.5)],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight),
            // ),
            child: controller.isLoading == false
                ?Center(child: CircularProgressIndicator(),)
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final item = controller.listData[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(HomeRoutes.FOOTBALL,arguments: [item.code,item.name!]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(width: 1,color: Colors.white70),
                            color: Colors.red.withOpacity(0.35)
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: CachedNetworkImage(
                                imageUrl: item.emblem!,
                                width: 100,
                                height: 100,
                                placeholder: (context, url) =>
                                    LoadingIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
