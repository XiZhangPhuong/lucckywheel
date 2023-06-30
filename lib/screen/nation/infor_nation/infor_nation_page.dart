import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/screen/nation/infor_nation/infor_nation_controller.dart';

class InforNationPage extends GetView<InforNationController> {
  const InforNationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: InforNationController(),
      builder: (InforNationController controller) {
        return Scaffold(
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
        );
      },
    );
  }
}