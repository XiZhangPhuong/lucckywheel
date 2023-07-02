import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
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
            if (details.velocity.pixelsPerSecond.dx > 1000) {
              Get.back();
            } else if (details.velocity.pixelsPerSecond.dx < -1000) {
              Get.back();
            }
          },
          child: Scaffold(
            floatingActionButton: GetX<NationController>(
              builder: (NationController controller) {
                return _floatTingButton(controller);
              },
            ),
            appBar: controller.isLoading == false
                ? null
                : AppBar(
                    backgroundColor: Color(0xff1a1a1a),
                    elevation: 0,
                    title: Text(
                      'txt_dansothegioi'.tr,
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
                    actions: [
                      IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                           // controller.showTopSheet(context);
                          }),
                    ],
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
                    ? LoadingIndicator()
                    : RefreshIndicator(
                        backgroundColor: Colors.black38,
                        color: Colors.white,
                        onRefresh: () async {
                          controller.getNation();
                        },
                        child: Column(
                          children: [
                            _textField(controller),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                controller: controller.scrollController,
                                shrinkWrap: true,
                                itemCount: controller.listNation.length,
                                itemBuilder: (context, index) {
                                  final item = controller.listNation[index];
                                  return ListTile(
                                    onTap: () {
                                      controller.showBottom(
                                          nationResponse: item);
                                    },
                                    trailing: Text(
                                      index < 3 ? (index + 1).toString() : '',
                                      style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
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
                              ),
                            ),
                          ],
                        ),
                      )),
          ),
        );
      },
    );
  }

  ///
  /// floatingButon
  ///
  AnimatedOpacity _floatTingButton(NationController controller) {
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

  ///
  /// textField
  ///
  Widget _textField(NationController controller) {
    return Visibility(
      visible: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          style: GoogleFonts.nunito(fontSize: 16, color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[800]!),
            ),
            labelStyle: GoogleFonts.nunito(fontSize: 16, color: Colors.white),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[800]!), 
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors
                      .grey[800]!), 
            ),
            hintText: 'Enter text',
            hintStyle: TextStyle(color: Colors.grey[800]!),
          ),
        ),
      ),
    );
  }
}
