import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/screen/techport/techport_controller.dart';

class TechPortPage extends GetView<TechPortController> {
  const TechPortPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TechPortController(),
      builder: (TechPortController controller) {
        final item = controller.techPortResponse;
        return Scaffold(
          // appBar: controller.isLoading == false
          //     ? null
          //     : AppBar(
          //         backgroundColor: Color(0xff1a1a1a),
          //         elevation: 0,
          //         title: Text(
          //           '${item.startMonth}/${item.startYear}  -  ${item.endMonth}/${item.endYear}',
          //           style: GoogleFonts.nunito(
          //             fontSize: 20,
          //             color: Colors.white,
          //           ),
          //         ),
          //         leading: IconButton(
          //           icon: Icon(Icons.arrow_back),
          //           onPressed: () {
          //             Get.back();
          //           },
          //           tooltip: 'Back',
          //         ),
          //       ),
          floatingActionButton: GetX<TechPortController>(
            builder: (TechPortController controller) {
              return _floatTingButton(controller);
            },
          ),
          backgroundColor: Color(0xff1a1a1a),
          body: SafeArea(
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
                  : Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 3,
                          ),
                          child: Row(
                         //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                alignment: Alignment.centerLeft,
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              IconButton(onPressed: () {
                                controller.clickButtonVolume(text: item.description!);
                              }, icon: Icon(Icons.volume_up,color: Colors.white,),),
                              AnimatedOpacity(
                                opacity: !controller.isScrool ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 300),
                                child: RotatedBox(
                                  quarterTurns: 2,
                                  child: IconButton(
                                    alignment: Alignment.centerLeft,
                                    onPressed: () {
                                      controller.scrollToBottom();
                                    },
                                    icon: Icon(
                                      Icons.arrow_upward,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: controller.scrollController,
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title! +
                                        ' | ${item.startMonth}/${item.startYear}  -  ${item.endMonth}/${item.endYear}',
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.benefits!,
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.description!,
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
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

///
/// floatingButon
///
Widget _floatTingButton(TechPortController controller) {
  return AnimatedOpacity(
    opacity: controller.showFloatingButton.value ? 1.0 : 0.0,
    duration: Duration(microseconds: 300),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            colors: [Colors.black12, Colors.black38, Colors.black45]),
      ),
      child: FloatingActionButton(
        onPressed: () {
          controller.scrollToTop();
        },
        child: Icon(Icons.arrow_upward),
        mini: true,
        backgroundColor: Colors.transparent,
      ),
    ),
  );
}
