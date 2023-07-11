import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/base_image.dart';
import 'package:luckywheel/base/loading.dart';

import 'package:luckywheel/screen/techtransfer/techtransfer_controller.dart';

class TecchTransFerPage extends GetView<techTransFerController> {
  const TecchTransFerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: techTransFerController(),
      builder: (techTransFerController controller) {
        return Scaffold(
          backgroundColor: Color(0xff1a1a1a),
          body: SingleChildScrollView(
            child: Container(
              height: Get.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black12, Colors.blue.withOpacity(0.5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: controller.isLoading == false
                  ? LoadingIndicator()
                  : PageView.builder(
                      controller: controller.pageControler,
                      itemCount: controller.techTransFerResponse.count,
                      itemBuilder: (context, index) {
                        final item =
                            controller.techTransFerResponse.results![index];
                        return Scaffold(
                            backgroundColor: Color(0xff1a1a1a),
                            floatingActionButton: AnimatedOpacity(
                              duration: Duration(microseconds: 500),
                              opacity: index != item.length ? 1 : 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: [
                                    Colors.black12,
                                    Colors.black38,
                                    Colors.black45
                                  ]),
                                ),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    controller.nextPage(item.length);
                                  },
                                  child: RotatedBox(
                                      quarterTurns: 2,
                                      child: Icon(Icons.arrow_back)),
                                  backgroundColor: Colors.transparent,
                                  mini: true,
                                ),
                              ),
                            ),
                            body: Container(
                              height: Get.height,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black12,
                                      Colors.blue.withOpacity(0.5)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                    child: Stack(
                                      children: [
                                        PhuongImage(
                                          url: item[10].toString(),
                                        ),
                                        Positioned(
                                          top: 15,
                                          left: 15,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black38
                                                  .withOpacity(0.4),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          right: 10,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 15,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Colors.black38
                                                    .withOpacity(0.4)),
                                            child: Center(
                                              child: Text(
                                                '${index + 1}/${controller.techTransFerResponse.total}',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  item[1].toString(),
                                                  style: GoogleFonts.nunito(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .clickButtonVolume(
                                                              text: item[3]
                                                                  .toString());
                                                    },
                                                    icon: Icon(
                                                      Icons.volume_up,
                                                      color: Colors.white,
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              item[3].toString(),
                                              style: GoogleFonts.nunito(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                          
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ));
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
