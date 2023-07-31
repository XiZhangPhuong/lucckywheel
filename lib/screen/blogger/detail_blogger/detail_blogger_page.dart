import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:luckywheel/screen/blogger/detail_blogger/detail_blogger_controller.dart';
class DetailBloggerPage extends GetView<DetailBloggerController> {
  const DetailBloggerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DetailBloggerController(),
      builder:  (DetailBloggerController controller) {
        return Scaffold(
           appBar: controller.isLoading==false ? null : AppBar(
            backgroundColor: ColorResources.MAIN,
           
            title: Text(controller.detailPost['title'],style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 18,
            ),),
           ),
          body: controller.isLoading==false ? Center(child: CircularProgressIndicator()) : 
          Container(
            child: WebView(
               initialUrl: 'data:text/html;charset=utf-8,' + Uri.encodeComponent(controller.detailPost['content'].toString()),
               javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
          
        );  
      },
    );
  }
}