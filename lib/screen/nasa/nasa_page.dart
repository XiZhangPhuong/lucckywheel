import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/screen/nasa/nasa_controller.dart';

class NasaPage extends GetView<NasaController> {
  const NasaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NasaController(),
      builder: (NasaController controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1a1a1a),
            elevation: 0,
            leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () {
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
            child: Center(
              child: controller.isLoading == false
                  ? const CircularProgressIndicator()
                  : _hinhAnhThienVan(controller),
            ),
          ),
        );
      },
    );
  }

  ///
  /// hinh anh thien van
  ///
  Widget _hinhAnhThienVan(NasaController controller) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
             controller.nasaResponse.date!,
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(controller.nasaResponse.title!,
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: Colors.white,
              )),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              controller.nasaResponse.url!,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              controller.nasaResponse.explanation!,
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
