import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/screen/nation/nation_controller.dart';

class NationPage extends GetView<NationController> {
  const NationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NationController(),
      builder: (NationController controller) {
        return GestureDetector(
          onHorizontalDragEnd: (details) {
            if(details.velocity.pixelsPerSecond.dx>1000){
              Get.back();
            }
          },
          child: Scaffold(
            floatingActionButton: GetX<NationController>(
              builder: (NationController controller) {
                return AnimatedOpacity(
                  opacity: controller.showFloatingButton.value ? 1.0 : 0.0,
                  duration: Duration(microseconds: 300),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [Colors.black12, Colors.black38,Colors.black45]),
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
              },
            ),
            appBar: AppBar(
              backgroundColor: Color(0xff1a1a1a),
              elevation: 0,
              title: Text(
                'Word Population',
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
            backgroundColor: Color(0xff1a1a1a),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black12, Colors.blue.withOpacity(0.5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: controller.isLoading == false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        controller: controller.scrollController,
                        shrinkWrap: true,
                        itemCount: controller.listNation.length,
                        itemBuilder: (context, index) {
                          final item = controller.listNation[index];
                          return ListTile(
                            onTap: () {
                              controller.showBottom(nationResponse: item);
                            },
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(7.0),
                              child: Image.network(
                                item.flags!.png!,
                                width: 70,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              item.name!.common!,
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              controller.formatNumber(item.population!),
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      )),
          ),
        );
      },
    );
  }
}
